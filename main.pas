unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls;

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
    procedure lsvRefresh;
    procedure FormCreate(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure DeleteRecord1Click(Sender: TObject);
    procedure lsvItemLibSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem: TListItem;
  end;

var
  FormMain: TFormMain;



implementation

uses data_module;

{$R *.dfm}



procedure TFormMain.lsvRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_ITEM_LIB');
    dm.ibq.Open;
    lsvItemLib.Items.BeginUpdate;
    lsvItemLib.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvItemLib.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);
        dm.ibq.Next;
    end;
    lsvItemLib.Items.EndUpdate;
end;



procedure TFormMain.FormCreate(Sender: TObject);
begin
    lsvRefresh;
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

end.



