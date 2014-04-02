unit riv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type

  TUser = record
    name : string[50];
    id_no : string[20];
  end;

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

  end;

var
  FormRIV: TFormRIV;
  users : array of TUser;
  id_nos, names : array of String;

implementation

uses data_module, login, main, shared;

{$R *.dfm}


function findindex(item : string):integer;
var i : integer;
begin
    for i := Low(users) to High(users) do begin
        if AnsiSameText(item, users[i].id_no) then begin
            Result := i;
            Break;
        end;
    end;
end;


procedure TFormRIV.loadElements;
var i: integer;
    name: string;
begin
    { you must have EU rights for you to appear in the Requestor combo box }

    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select ID_NO, Last_name, first_name from SELECT_USERS order by last_name');
    dm.ibq.Open;
    cbo_Requestor.Items.BeginUpdate;
    cbo_Requestor.Items.Clear;

    i := 0;
    while not dm.ibq.Eof do begin
        SetLength(id_nos, i+1);
        SetLength(names, i+1);
        SetLength(users, i+1);

        with users[i] do begin
           id_no := dm.ibq.Fields.Fields[0].AsString;
           name  := dm.ibq.Fields.Fields[1].AsString + ', ' + dm.ibq.Fields.Fields[2].AsString;
        end;

        cbo_Requestor.Items.Add(users[i].name);
        dm.ibq.Next;
        i := i + 1;
    end;
    cbo_Requestor.Items.EndUpdate;
    dm.ibt.Commit;
end;


procedure TFormRIV.FormShow(Sender: TObject);
begin
    if cbo_Requestor.Items.Count = 0 then begin
        loadElements;
    end;
    if shared.riv_form_state = 'Add' then
        cbo_Requestor.ItemIndex := findindex(shared.user_id);
    if riv_form_state = 'Update' then
        cbo_Requestor.ItemIndex := findindex(FormMain.CurrentRIV.SubItems.Strings[1]);
end;


procedure TFormRIV.BitBtn2Click(Sender: TObject);
begin
    Close;
end;


procedure TFormRIV.BitBtn1Click(Sender: TObject);
var
    form_validated : Boolean;

begin
    form_validated := False;
    if cbo_Requestor.ItemHeight = -1 then begin
        MessageDlg('Requestor must not be blank.', mtError, mbOKCancel, 1);
        cbo_Requestor.SetFocus;
    end
    else
        form_validated := True;

    if (form_validated = True) then begin

        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('execute procedure UPDATE_FLOWS(:id,:ftype,:description,:f_no,:requestor,:create_date,:created_by,:current_step,:status,:remarks)');
        if riv_form_state = 'Add' then
            dm.ibq.ParamByName('id').AsInteger := 0
        else
            dm.ibq.ParamByName('id').AsInteger := StrToInt(led_ID.Text);
        dm.ibq.ParamByName('ftype').AsString := shared.ftype;
        dm.ibq.ParamByName('description').AsString := Memo_RIV_Description.Lines.Text;
        dm.ibq.ParamByName('f_no').AsString := led_rivno.Text;
        dm.ibq.ParamByName('requestor').AsString := users[cbo_Requestor.ItemIndex].id_no;
        dm.ibq.ParamByName('create_date').AsDateTime := Now;
        dm.ibq.ParamByName('created_by').AsString := shared.user_id;
        dm.ibq.ParamByName('current_step').AsInteger := 2;
        dm.ibq.ParamByName('status').AsString := 'WIP';
        dm.ibq.ParamByName('remarks').AsString := Memo_Remarks.Lines.Text;

        dm.ibq.ExecSQL;
        if dm.ibt.InTransaction then
            dm.ibt.Commit;

        // add a record to the flow_data table for this RIV
        // this is done via the stored procedure UPDATE_RIVS

        Close;
        FormMain.lsvRefresh;
    end


end;

end.
