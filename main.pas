unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type

  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    popItemLib: TPopupMenu;
    Refresh1: TMenuItem;
    AddRecord1: TMenuItem;
    UpdateRecord1: TMenuItem;
    Logout: TMenuItem;
    StatusBar1: TStatusBar;
    lsvTickets: TListView;
    ControlBar1: TControlBar;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditRIVSearch: TEdit;
    myRights: TCheckBox;
    cboType: TComboBox;
    SpeedButton3: TSpeedButton;
    FlowAdmin1: TMenuItem;
    procedure Initialize;
    procedure lsvRefresh;
    procedure Refresh1Click(Sender: TObject);
    procedure DeleteRecord1Click(Sender: TObject);
    procedure UpdateRecord1Click(Sender: TObject);
    procedure AddRecord1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lsvTicketsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure EditRIVSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lsvTicketsDblClick(Sender: TObject);
    procedure ProcessRecord1Click(Sender: TObject);
    procedure lsvTicketsColumnClick(Sender: TObject; Column: TListColumn);
    procedure LogoutClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FlowAdmin1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem, CurrentItem : TListItem;
  end;



var
  FormMain: TFormMain;


implementation

uses data_module, riv, login, process, shared, flows, ticket;

{$R *.dfm}



procedure TFormMain.Initialize;
var
    i: integer;
begin

    { LOAD CATEGORIES INTO SHARED SPACE }
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select id, name from CATEGORY order by name');
    dm.ibq.Open;

    cboType.Items.BeginUpdate;
    cboType.Items.Clear;
    i := 0;
    while not dm.ibq.Eof do begin
        SetLength(shared.categories, i+1);

        with shared.categories[i] do begin
            id := dm.ibq.Fields.Fields[0].AsInteger;
            name := dm.ibq.Fields.Fields[1].AsString;
        end;

        cboType.Items.Add(shared.categories[i].name);
        dm.ibq.Next;
        i := i + 1;
    end;
    cboType.Items.EndUpdate;
    cboType.ItemIndex := 0;

    { LOAD USERS INTO SHARED SPACE }
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select ID_NO, Last_name, first_name from SELECT_USERS order by last_name');
    dm.ibq.Open;
    i := 0;
    while not dm.ibq.Eof do begin
        SetLength(shared.users, i+1);
        with shared.users[i] do begin
           id_no := dm.ibq.Fields.Fields[0].AsString;
           name  := dm.ibq.Fields.Fields[1].AsString + ', ' + dm.ibq.Fields.Fields[2].AsString;
        end;
        dm.ibq.Next;
        i := i + 1;
    end;
    dm.ibt.Commit;

    FormTicket.loadElements;
end;


procedure TFormMain.lsvRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_TICKETS(:a, :b)');
    dm.ibq.Params[0].AsString := cboType.Text;
    dm.ibq.Params[1].AsString := '%' + EditRIVSearch.Text + '%';
    dm.ibq.Open;

    lsvTickets.Items.BeginUpdate;
    lsvTickets.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvTickets.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;      // id
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);   // subject
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);   // description

        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);   // user_id
        NewItem.SubItems.Add(shared.users[shared.findindex(dm.ibq.Fields.Fields[3].AsString)].name);   // user_name

        NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);   // requester_id
        NewItem.SubItems.Add(shared.users[shared.findindex(dm.ibq.Fields.Fields[4].AsString)].name);   // requester

        NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);   // is_open
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[6].AsString);   // created
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[7].AsString);   // modified
        dm.ibq.Next;
    end;
    lsvTickets.Items.EndUpdate;
end;



procedure TFormMain.Refresh1Click(Sender: TObject);
begin
    lsvRefresh;
end;


procedure TFormMain.DeleteRecord1Click(Sender: TObject);
var
    pass : string;
begin
    pass := '121';
    if InputBox('Enter Administrator Password', 'Password: ', '') = pass then begin

    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('execute procedure UPDATE_FLOWS(:id,:ftype,:description,:f_no,:requestor,:create_date,:created_by,:current_step,:status,:remarks)');
    dm.ibq.ParamByName('id').AsInteger := strtoint(CurrentItem.Caption) * -1;
    dm.ibq.ParamByName('ftype').AsString := '';
    dm.ibq.ParamByName('description').AsString := '';
    dm.ibq.ParamByName('f_no').AsString := '';
    dm.ibq.ParamByName('requestor').AsString := '';
    dm.ibq.ParamByName('create_date').AsDateTime := Now;
    dm.ibq.ParamByName('created_by').AsString := '';
    dm.ibq.ParamByName('current_step').AsInteger := 0;
    dm.ibq.ParamByName('status').AsString := '';
    dm.ibq.ParamByName('remarks').AsString := '';

    dm.ibq.Prepare;
    dm.ibq.ExecSQL;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;
    lsvRefresh;

    end;
end;



procedure TFormMain.UpdateRecord1Click(Sender: TObject);
begin
    shared.ticket_form_state := 'Update';
    shared.ftype := cboType.Text;
    shared.ticket_id := StrToInt(CurrentItem.Caption);

    with ticket_data do begin
        id          := StrToInt(CurrentItem.Caption);
        subject     := CurrentItem.SubItems.Strings[0];
        description := CurrentItem.SubItems.Strings[1];
        user_id     := CurrentItem.SubItems.Strings[2];
        requester   := CurrentItem.SubItems.Strings[4];
        is_open     := StrToInt(CurrentItem.SubItems.Strings[6]);
        category_id := cboType.ItemIndex;
        created     := StrToDateTime(CurrentItem.SubItems.Strings[7]);
    end;

    FormTicket.Caption := CurrentItem.Caption;
    FormTicket.edtSubject.Text := CurrentItem.SubItems.Strings[0];
    FormTicket.Memo_Description.Text := CurrentItem.SubItems.Strings[1];
    FormTicket.cboCategory.ItemIndex := cboType.ItemIndex;
    FormTicket.cboUser.ItemIndex := findindex(CurrentItem.SubItems.Strings[2]);
    FormTicket.cboRequester.ItemIndex := findindex(CurrentItem.SubItems.Strings[4]);

    if CurrentItem.SubItems.Strings[6] = '1' then
        FormTicket.chkbox_isOpen.Caption := 'Close Ticket'
    else
        FormTicket.chkbox_isOpen.Caption := 'Reopen Ticket';
        
    FormTicket.ShowModal;
end;

procedure TFormMain.AddRecord1Click(Sender: TObject);
begin
    shared.ftype := cboType.Text;
    shared.ticket_form_state := 'Add';
    FormTicket.ShowModal;
end;

procedure TFormMain.SpeedButton1Click(Sender: TObject);
begin
    lsvRefresh;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
    Initialize;
    lsvRefresh;
end;


procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;


procedure TFormMain.lsvTicketsChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
    CurrentItem := lsvTickets.Selected;
end;


procedure TFormMain.EditRIVSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
        lsvRefresh;

end;


procedure TFormMain.lsvTicketsDblClick(Sender: TObject);
begin
  if CurrentItem <> nil then
      UpdateRecord1Click(self);

end;


procedure TFormMain.ProcessRecord1Click(Sender: TObject);
begin
    shared.ftype := cboType.Text;
end;


procedure TFormMain.lsvTicketsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  { determine the sort style }
  if (Column.Index = 0) or (Column.Index = 2) then
    LvSortStyle := cssNumeric
  else
    LvSortStyle := cssAlphaNum;

  { Call the CustomSort method }
  lsvTickets.CustomSort(@CustomSortProc, Column.Index -1);
  { Set the sort order for the column}
  LvSortOrder[Column.Index] := not LvSortOrder[Column.Index];

end;


procedure TFormMain.LogoutClick(Sender: TObject);
begin
    shared.user_id := '';
    shared.CurrentUser := '';
    shared.user_name := '';
    shared.rights := '';

    FormMain.Hide;
    FormLogin.ShowModal;
end;


procedure TFormMain.About2Click(Sender: TObject);
begin
    MessageDlg('PROARMM Ticketing System Version 0.8.2', mtInformation, mbOKCancel, 1)
end;


procedure TFormMain.SpeedButton3Click(Sender: TObject);
begin
    Initialize;
end;


procedure TFormMain.FlowAdmin1Click(Sender: TObject);
begin
    FormFlowAdmin.ShowModal;
end;

end.
