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
    TabControl2: TTabControl;
    lsvRIV: TListView;
    procedure transactionsRefresh;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem : TListItem;
    rivid : integer;
  end;

var
  FormProcess: TFormProcess;

implementation

{$R *.dfm}

uses data_module, main;

procedure TFormProcess.transactionsRefresh;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_RIV_TRANSACTIONS(:a)');
    dm.ibq.Params[0].AsInteger := rivid;
    dm.ibq.Open;

    lsvRIVtransactions.Items.BeginUpdate;
    lsvRIVtransactions.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvRIVtransactions.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[1].AsString;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[0].AsString);
        if dm.ibq.Fields.Fields[2].AsString = '1' then
        begin
            NewItem.Checked := True;
        end
        else
            NewItem.Checked := False;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);
        dm.ibq.Next;
    end;
    lsvRIVtransactions.Items.EndUpdate;
end;

procedure TFormProcess.FormShow(Sender: TObject);
begin
    transactionsRefresh;
end;


procedure TFormProcess.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TFormProcess.BitBtn1Click(Sender: TObject);
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

{    dm.ibq.SQL.Add('execute procedure update_rivs(:id, :b, :c, :d, :e, :f, :g, :h)');
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
}
end;

end.

