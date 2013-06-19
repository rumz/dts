unit riv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormRIV = class(TForm)
    led_ID: TLabeledEdit;
    led_rivno: TLabeledEdit;
    Label1: TLabel;
    Memo_RIV_Description: TMemo;
    Label2: TLabel;
    cbo_Requestor: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Memo_Remarks: TMemo;
    procedure loadElements;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    riv_form_state : String; 
  end;

var
  FormRIV: TFormRIV;

implementation

uses data_module, main;

{$R *.dfm}


procedure TFormRIV.loadElements;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select ID_NO from SELECT_USERS order by id_no');
    dm.ibq.Open;
    cbo_Requestor.Items.BeginUpdate;
    cbo_Requestor.Items.Clear;
    while not dm.ibq.Eof do begin
        cbo_Requestor.Items.Add(dm.ibq.Fields.Fields[0].AsString);
        dm.ibq.Next;
    end;
    cbo_Requestor.Items.EndUpdate;
end;


procedure TFormRIV.FormShow(Sender: TObject);
begin
    if cbo_Requestor.Items.Count = 0 then begin
        loadElements;
    end;
    if riv_form_state = 'Update' then
        cbo_Requestor.ItemIndex := cbo_Requestor.Items.IndexOf(FormMain.CurrentRIV.SubItems.Strings[1]);
    


end;

procedure TFormRIV.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TFormRIV.BitBtn1Click(Sender: TObject);
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('execute procedure UPDATE_RIVS(:a,:b,:c,:d,:e,:f,:g,:h,:i)');
    if riv_form_state = 'Add' then
        dm.ibq.Params[0].AsInteger := 0
    else
        dm.ibq.Params[0].AsInteger := StrToInt(led_ID.Text);
    dm.ibq.Params[1].AsString := Memo_RIV_Description.Lines.Text;
    dm.ibq.Params[2].AsString := led_rivno.Text;
    dm.ibq.Params[3].AsString := cbo_Requestor.Text;
    dm.ibq.Params[4].AsDateTime := Now;
    dm.ibq.Params[5].AsString := FormMain.CurrentUser;  // created by
    dm.ibq.Params[6].AsInteger := 1;  // current_step = 2
    dm.ibq.Params[7].AsString := 'WIP';  // status
    dm.ibq.Params[8].AsString := Memo_Remarks.Lines.Text;
    dm.ibq.ExecSQL;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;

    // add a record to the flow_data table for this RIV 
    // do this via the stored procedure

    Close;
    FormMain.lsvRefresh;


end;

end.
