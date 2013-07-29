unit process;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFormProcess = class(TForm)
    Label2: TLabel;
    MemoRemarks: TMemo;
    Deny: TBitBtn;
    BitBtn2: TBitBtn;
    led_status: TLabeledEdit;
    Approve: TBitBtn;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    TabControl2: TTabControl;
    lsvRIV: TListView;
    TabControl1: TTabControl;
    lsvRIVtransactions: TListView;
    Splitter1: TSplitter;
    Receive: TBitBtn;
    ApproveAs: TBitBtn;
    DenyAs: TBitBtn;
    procedure transactionsRefresh;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DenyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem : TListItem;
    current_flow_id : integer;
  end;

var
  FormProcess: TFormProcess;

implementation

{$R *.dfm}

uses data_module, main, login, DB, shared, loginas;

procedure TFormProcess.transactionsRefresh;
begin
    // get transactions for the current RIV
    current_flow_id := 0;
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_FLOW_TRANSACTIONS(:f_id, :f_type)');
    dm.ibq.ParamByName('f_id').AsInteger := riv_id;
    dm.ibq.ParamByName('f_type').AsString := shared.ftype;
    dm.ibq.Open;

    lsvRIVtransactions.Items.BeginUpdate;
    lsvRIVtransactions.Items.Clear;
    while not dm.ibq.Eof do begin
        NewItem := lsvRIVtransactions.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[1].AsString;           // status
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[0].AsString);        // flow_id
        if dm.ibq.Fields.Fields[2].AsString = '1' then                 // approved
        begin
            NewItem.Checked := True;
            current_flow_id := dm.ibq.Fields.Fields[0].AsInteger;      // if we use a SP we dont need this anymore
        end
        else
            NewItem.Checked := False;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);        // approved_by
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);        // approved_date
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);        // remarks
        dm.ibq.Next;
    end;
    lsvRIVtransactions.Items.EndUpdate;

    if dm.ibt.InTransaction then
        dm.ibt.Commit;

    if lsvRIV.Items.Count > current_flow_id then
    begin
        led_status.Text := lsvRIV.Items.Item[current_flow_id].SubItems[0]
    end
    else
        led_status.Text := '';

    // this is where the rights checking is

    if StrPos(PChar(shared.rights), PChar(lsvRIV.Items.Item[current_flow_id].Caption)) = nil then
    begin
        Approve.Enabled := False;
        Deny.Enabled := False;
    end
    else begin
        Approve.Enabled := True;
        Deny.Enabled := True;
    end;


end;

procedure TFormProcess.FormShow(Sender: TObject);
begin
    // load up the STEPS needed for RIVS; we only need to do this once
    lsvRIV.Items.BeginUpdate;
    lsvRIV.Items.Clear;

    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_FLOW_LIB_DATA(:ftype)');
    dm.ibq.ParamByName('ftype').AsString := shared.ftype;
    dm.ibq.Open;
    while not dm.ibq.Eof do begin
        NewItem := lsvRIV.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
        dm.ibq.Next;
    end;
    lsvRIV.Items.EndUpdate;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;

    transactionsRefresh;
    FormProcess.Caption := 'Process RIV - ' + riv_no + ' (' + riv_description + ')';
end;


procedure TFormProcess.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TFormProcess.DenyClick(Sender: TObject);
var
    action : integer;
    remarks, msg : string;
    loginas_hasrights : integer;

begin
    // this is just an unbelievable mess.  please refactor this when you have time

    if Sender = Approve then
        action := 1
    else if Sender = Deny then
        action := 0
    else if Sender = Receive then
        action := 2;

    if (Sender = ApproveAs) or (Sender = DenyAs) then begin
        FormLoginAs.ShowModal;

        if StrPos(PChar(shared.loginasrights), PChar(lsvRIV.Items.Item[current_flow_id].Caption)) = nil then
        begin
            msg := 'Account ' + shared.loginas + ' does not have the rights needed to perform this operation.';
            MessageDlg(msg, mtError, mbOKCancel, 1);
            loginas_hasrights := 0;
        end
        else begin
            // run update_flow_data using the correct data
            if Sender = ApproveAs then
                action := 1
            else if Sender = DenyAs then
                action := 0;
            loginas_hasrights := 1;
        end;
    end;


    // todo check user rights before running the SP

    if ((Sender = Approve) or (Sender = Deny) or (Sender = Receive)) or
       (((Sender = ApproveAs) or (Sender = DenyAs)) and (loginas_hasrights = 1)) then begin

        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;

        dm.ibq.SQL.Add('execute procedure UPDATE_FLOW_DATA(:id, :f_id, :flow_id, :approved, :approved_by, :approved_date, :remarks)');

        dm.ibq.ParamByName('id').AsInteger := 0;
        dm.ibq.ParamByName('f_id').AsInteger := riv_id;
        dm.ibq.ParamByName('flow_id').AsInteger := current_flow_id + 1;
        dm.ibq.ParamByName('approved').AsInteger := action;
        if (Sender = ApproveAs) or (Sender = DenyAs) then
            dm.ibq.ParamByName('approved_by').AsString := shared.loginasuserid
        else
            dm.ibq.ParamByName('approved_by').AsString := shared.user_id;
        dm.ibq.ParamByName('approved_date').AsDateTime := Now;

        if action = 1 then                                    // remarks
            remarks := 'Approved'
        else if action = 0 then
            remarks := 'Denied'
        else if action = 2 then
            remarks := 'Received'
        else if action = 3 then
            remarks := '';

        if MemoRemarks.Lines.Text <> '' then
            remarks := remarks + ' - ' + trim(MemoRemarks.Lines.Text);
        dm.ibq.ParamByName('remarks').AsString := remarks;

        dm.ibq.Prepare;
        dm.ibq.ExecSQL;
        if dm.ibt.InTransaction then
            dm.ibt.Commit;
        MemoRemarks.Lines.Clear;

        transactionsRefresh;
    end;
end;


procedure TFormProcess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormMain.lsvRefresh;
end;

end.

