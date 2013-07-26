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
    ComboBox1: TComboBox;
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
    procedure popItemLibPopup(Sender: TObject);
    procedure ProcessRecord1Click(Sender: TObject);
    procedure lsvRIV2ColumnClick(Sender: TObject; Column: TListColumn);
    procedure LogoutClick(Sender: TObject);
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




procedure TFormMain.lsvRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

    // need to change this to be able to query a generic table
    if myRights.Checked then begin
        dm.ibq.SQL.Add('select * from SELECT_RIVS(:a, :b, :c)');
        dm.ibq.Params[2].AsString := shared.user_id;
    end
    else
        dm.ibq.SQL.Add('select * from SELECT_RIVS2(:a, :b)');
    dm.ibq.Params[0].AsString := 'riv_no';
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
    dm.ibq.SQL.Add('execute procedure update_rivs(:id, :b, :c, :d, :e, :f, :g, :h, :i)');
    dm.ibq.Params[0].AsInteger := strtoint(CurrentRIV.Caption) * -1;
    dm.ibq.Params[1].AsString := '';
    dm.ibq.Params[2].AsString := '';
    dm.ibq.Params[3].AsString := '';
    dm.ibq.Params[4].AsDateTime := Now;
    dm.ibq.Params[5].AsString := '';
    dm.ibq.Params[6].AsInteger := 1;  // current_step = 2
    dm.ibq.Params[7].AsString := '';
    dm.ibq.Params[8].AsString := '';

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

procedure TFormMain.popItemLibPopup(Sender: TObject);
begin
    { TODO: check rights based on the rights of the user and the current status the item has }
    if (CurrentRIV <> nil) then
    begin
{        if trim(CurrentRIV.SubItems.Strings[1]) = trim(StatusBar1.Panels.Items[0].Text) then
            ProcessRecord1.Enabled := True
        else
            ProcessRecord1.Enabled := False;
}
    end

end;

procedure TFormMain.ProcessRecord1Click(Sender: TObject);
begin
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

end.



