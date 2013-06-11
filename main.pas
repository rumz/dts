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
    tabRIV: TTabSheet;
    lsvRIV: TListView;
    LabeledEdit2: TLabeledEdit;
    StaticText1: TStaticText;
    Memo1: TMemo;
    TabSheet1: TTabSheet;
    lsvUsers: TListView;
    cboRequestor: TComboBox;
    Label1: TLabel;
    TabRiv2: TTabSheet;
    StatusBar1: TStatusBar;
    ControlBar1: TControlBar;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EditRIVSearch: TEdit;
    lsvRIV2: TListView;
    SpeedButton2: TSpeedButton;
    procedure lsvRefresh;
    procedure FormCreate(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure DeleteRecord1Click(Sender: TObject);
    procedure lsvItemLibSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure UpdateRecord1Click(Sender: TObject);
    procedure AddRecord1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem: TListItem;
    CurrentUser: String;
  end;

var
  FormMain: TFormMain;



implementation

uses data_module, item_library, riv, login;

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
        dm.ibq.Params[1].AsString := '%' + EditRIVSearch.Text;
    end
    else if pgc.TabIndex = 3 then
    begin
        //dm.ibq.SQL.Add('select * from SELECT_USERS');
    end;
    dm.ibq.Open;


    if pgc.TabIndex = 0 then
    begin
      lsvRIV2.Items.BeginUpdate;
      lsvRIV2.Items.Clear;
//      lsvItemLib.Items.BeginUpdate;
//      lsvItemLib.Items.Clear;
      while not dm.ibq.Eof do begin
          NewItem := lsvRIV2.Items.Add;
          NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);
          dm.ibq.Next;
      end;
      lsvRIV2.Items.EndUpdate;
    end
    else if pgc.TabIndex = 3 then
    begin
       lsvUsers.Items.BeginUpdate;
       lsvUsers.Items.Clear;
       while not dm.ibq.Eof do begin
          NewItem := lsvUsers.Items.Add;
          NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
          dm.ibq.Next;
       end;
       lsvUsers.Items.EndUpdate;
    end
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
    dm.ibq.SQL.Add('execute procedure DELETE_ITEM_LIB(:id)');
    dm.ibq.Params[0].AsInteger := strtoint(NewItem.Caption);
    dm.ibq.Prepare;
    dm.ibq.ExecSQL;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;
    lsvRefresh;
end;



procedure TFormMain.lsvItemLibSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
    NewItem := Item;
end;

procedure TFormMain.UpdateRecord1Click(Sender: TObject);
begin
    FormRIV.riv_form_state := 'Update';
    FormRIV.led_rivno.Text := ''
    FormRIV.cbo_Requestor.Items.Clear;
    FormRIV.Memo_RIV_Description.Lines.Clear;
    FormRIV.ShowModal;

end;

procedure TFormMain.AddRecord1Click(Sender: TObject);
begin
    FormRIV.riv_form_state := 'Add';
    FormRIV.led_rivno.Text := '';
    FormRIV.cbo_Requestor.Items.Clear;
    FormRIV.Memo_RIV_Description.Lines.Clear;
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

end.



