unit process;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormProcess = class(TForm)
    cbo_approve: TComboBox;
    TabControl1: TTabControl;
    lsvRIVtransactions: TListView;
    Label1: TLabel;
    Label2: TLabel;
    MemoRemarks: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem : TListItem;
  end;

var
  FormProcess: TFormProcess;

implementation

{$R *.dfm}

uses data_module, main;

procedure TFormProcess.FormShow(Sender: TObject);
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_RIV_TRANSACTIONS(:a)');
    dm.ibq.Params[0].AsInteger := 0;
    dm.ibq.Open;

    lsvRIVtransactions.Items.BeginUpdate;
    lsvRIVtransactions.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvRIVtransactions.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
        dm.ibq.Next;
    end;
    lsvRIVtransactions.Items.EndUpdate;

end;


procedure TFormProcess.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

end.

