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
    pgc: TPageControl;
    tabItemLib: TTabSheet;
    tabItems: TTabSheet;
    lsvItemLib: TListView;
    popItemLib: TPopupMenu;
    Refresh1: TMenuItem;
    AddRecord1: TMenuItem;
    DeleteRecord1: TMenuItem;
    UpdateRecord1: TMenuItem;
    TabRiv2: TTabSheet;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EditRIVSearch: TEdit;
    lsvRIV2: TListView;
    SpeedButton2: TSpeedButton;
    N2: TMenuItem;
    ProcessRecord1: TMenuItem;
    procedure lsvRefresh;
    procedure FormCreate(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem, CurrentRIV : TListItem;
    CurrentUser: String;
  end;

var
  FormMain: TFormMain;



implementation

uses data_module, item_library, riv, login, process;

{$R *.dfm}



procedure TFormMain.lsvRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

    if pgc.TabIndex = 0 then
    begin
        dm.ibq.SQL.Add('select * from SELECT_RIVS(:a, :b)');
        dm.ibq.Params[0].AsInteger := 0;
        dm.ibq.Params[1].AsString := '%' + EditRIVSearch.Text + '%';
    end;
    dm.ibq.Open;


    if pgc.TabIndex = 0 then
    begin
      lsvRIV2.Items.BeginUpdate;
      lsvRIV2.Items.Clear;
      while not dm.ibq.Eof do begin
          NewItem := lsvRIV2.Items.Add;
          NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[6].AsString);
          dm.ibq.Next;
      end;
      lsvRIV2.Items.EndUpdate;
    end;
end;



procedure TFormMain.FormCreate(Sender: TObject);
begin
//    FormLogin.ShowModal;
end;

procedure TFormMain.Refresh1Click(Sender: TObject);
begin
    lsvRefresh;
end;

procedure TFormMain.DeleteRecord1Click(Sender: TObject);
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('execute procedure update_rivs(:id, :b, :c, :d, :e, :f, :g, :h)');
    dm.ibq.Params[0].AsInteger := strtoint(CurrentRIV.Caption) * -1;
    dm.ibq.Params[1].AsString := '';
    dm.ibq.Params[2].AsString := '';
    dm.ibq.Params[3].AsString := '';
    dm.ibq.Params[4].AsDateTime := Now;
    dm.ibq.Params[5].AsString := '';
    dm.ibq.Params[6].AsInteger := 1;  // current_step = 2
    dm.ibq.Params[7].AsString := '';

    dm.ibq.Prepare;
    dm.ibq.ExecSQL;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;
    lsvRefresh;
end;



procedure TFormMain.UpdateRecord1Click(Sender: TObject);
begin
    FormRIV.riv_form_state := 'Update';
    FormRIV.led_ID.Text := CurrentRIV.Caption;
    FormRIV.led_rivno.Text := CurrentRIV.SubItems.Strings[0];
    FormRIV.cbo_Requestor.Text := CurrentRIV.SubItems.Strings[1];

    FormRIV.Memo_RIV_Description.Lines.Clear;
    FormRIV.Memo_RIV_Description.Lines.Text := CurrentRIV.SubItems.Strings[2];
    FormRIV.Memo_Remarks.Lines.Text := CurrentRIV.SubItems.Strings[5];
    FormRIV.ShowModal;
end;

procedure TFormMain.AddRecord1Click(Sender: TObject);
begin
    FormRIV.riv_form_state := 'Add';
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
    if not (CurrentRIV.Caption = '') then
    begin
        if trim(CurrentRIV.SubItems.Strings[1]) = trim(StatusBar1.Panels.Items[0].Text) then
            ProcessRecord1.Enabled := True
        else
            ProcessRecord1.Enabled := False;
    end

end;

procedure TFormMain.ProcessRecord1Click(Sender: TObject);
begin
    FormProcess.rivid := strtoint(CurrentRIV.Caption);
    FormProcess.ShowModal;
end;

end.



