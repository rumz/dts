unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type

  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    File1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    popItemLib: TPopupMenu;
    Refresh1: TMenuItem;
    AddRecord1: TMenuItem;
    DeleteRecord1: TMenuItem;
    UpdateRecord1: TMenuItem;
    N2: TMenuItem;
    ProcessRecord1: TMenuItem;
    Logout: TMenuItem;
    StatusBar1: TStatusBar;
    lsvRIV2: TListView;
    ControlBar1: TControlBar;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EditRIVSearch: TEdit;
    myRights: TCheckBox;
    cboType: TComboBox;
    procedure Initialize;
    procedure lsvRefresh;
    procedure Refresh1Click(Sender: TObject);
    procedure DeleteRecord1Click(Sender: TObject);
    procedure UpdateRecord1Click(Sender: TObject);
    procedure AddRecord1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lsvRIV2Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure EditRIVSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lsvRIV2DblClick(Sender: TObject);
    procedure ProcessRecord1Click(Sender: TObject);
    procedure lsvRIV2ColumnClick(Sender: TObject; Column: TListColumn);
    procedure LogoutClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem, CurrentRIV : TListItem;
  end;



var
  FormMain: TFormMain;




implementation

uses data_module, riv, login, process, shared;

{$R *.dfm}

procedure TFormMain.Initialize;
var
    idx : integer;
begin
    if cboType.Items.Count = 0 then begin
        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('select distinct ftype from FLOW_TYPES');
        dm.ibq.Open;

        while not dm.ibq.Eof do begin
            cboType.Items.Add(dm.ibq.Fields.Fields[0].AsString);
            dm.ibq.Next;
        end;

        idx := cboType.Items.IndexOf('RIV PRO');
        cboType.ItemIndex := idx;

    end;
end;



procedure TFormMain.lsvRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

    // need to change this to be able to query a generic table
    if myRights.Checked then begin
        dm.ibq.SQL.Add('select * from SELECT_FLOWS(:a, :b, :c)');
        dm.ibq.Params[2].AsString := shared.user_id;
    end
    else
        dm.ibq.SQL.Add('select * from SELECT_FLOWS2(:a, :b)');
    dm.ibq.Params[0].AsString := cboType.Text;
    dm.ibq.Params[1].AsString := '%' + EditRIVSearch.Text + '%';

    dm.ibq.Open;

    lsvRIV2.Items.BeginUpdate;
    lsvRIV2.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvRIV2.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;      // id
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);   // riv_no
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);   // requestor
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);   // requestor_name
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);   // description
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);   // create_date
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[6].AsString);   // status
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[7].AsString);   // remarks
        dm.ibq.Next;
    end;
    lsvRIV2.Items.EndUpdate;
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
    dm.ibq.ParamByName('id').AsInteger := strtoint(CurrentRIV.Caption) * -1;
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
    shared.riv_form_state := 'Update';
    shared.ftype := cboType.Text;
    FormRIV.led_ID.Text := CurrentRIV.Caption;
    FormRIV.led_rivno.Text := CurrentRIV.SubItems.Strings[0];
    FormRIV.cbo_Requestor.Text := CurrentRIV.SubItems.Strings[1];

    FormRIV.Memo_RIV_Description.Lines.Clear;
    FormRIV.Memo_RIV_Description.Lines.Text := CurrentRIV.SubItems.Strings[3];
    FormRIV.Memo_Remarks.Lines.Text := CurrentRIV.SubItems.Strings[6];
    FormRIV.ShowModal;
end;

procedure TFormMain.AddRecord1Click(Sender: TObject);
begin
    shared.ftype := cboType.Text;
    shared.riv_form_state := 'Add';
    FormRIV.led_rivno.Text := '';
    FormRIV.cbo_Requestor.ItemIndex := -1;
    FormRIV.Memo_RIV_Description.Lines.Clear;
    FormRIV.Memo_Remarks.Lines.Clear;
    FormRIV.ShowModal;
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

procedure TFormMain.lsvRIV2Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
    CurrentRIV := lsvRIV2.Selected;
end;

procedure TFormMain.EditRIVSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
        lsvRefresh;

end;

procedure TFormMain.lsvRIV2DblClick(Sender: TObject);
begin
  if CurrentRIV <> nil then
      UpdateRecord1Click(self);

end;

procedure TFormMain.ProcessRecord1Click(Sender: TObject);
begin
    shared.ftype := cboType.Text;
    shared.riv_id := strtoint(CurrentRIV.Caption);
    shared.riv_no := CurrentRIV.SubItems.Strings[0];
    shared.riv_description := CurrentRIV.SubItems.Strings[3];
    FormProcess.ShowModal;
end;


procedure TFormMain.lsvRIV2ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  { determine the sort style }
  if (Column.Index = 0) or (Column.Index = 2) then
    LvSortStyle := cssNumeric
  else
    LvSortStyle := cssAlphaNum;

  { Call the CustomSort method }
  lsvRIV2.CustomSort(@CustomSortProc, Column.Index -1);
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
    MessageDlg('Philhealth Document Tracking System Version 0.7.1', mtInformation, mbOKCancel, 1)
end;

end.



