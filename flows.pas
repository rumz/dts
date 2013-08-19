unit flows;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFormFlowAdmin = class(TForm)
    TabControl2: TTabControl;
    lsvFlow: TListView;
    ControlBar1: TControlBar;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cboType: TComboBox;
    Splitter1: TSplitter;
    GroupBox1: TGroupBox;
    LabeledEdit1: TLabeledEdit;
    cboRights: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label1: TLabel;
    procedure Initialize;
    procedure Refresh;
    procedure FormShow(Sender: TObject);
    procedure cboTypeChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem : TListItem;
    current_flow : string;
  end;

var
  FormFlowAdmin: TFormFlowAdmin;

implementation

uses data_module, main, shared;


{$R *.dfm}


procedure TFormFlowAdmin.Initialize;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select distinct ftype from FLOW_TYPES');
    dm.ibq.Open;

    cboType.Items.Clear;

    while not dm.ibq.Eof do begin
        cboType.Items.Add(dm.ibq.Fields.Fields[0].AsString);
        dm.ibq.Next;
    end;
    dm.ibt.Commit;


    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    cboRights.Items.Clear;
    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select distinct rights from FLOW_LIB');
    dm.ibq.Open;

    while not dm.ibq.Eof do begin
        cboRights.Items.Add(dm.ibq.Fields.Fields[0].AsString);
        dm.ibq.Next;
    end;
    dm.ibt.Commit;

end;


procedure TFormFlowAdmin.Refresh;
begin
    lsvFlow.Items.Clear;

    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select * from SELECT_FLOW_LIB_DATA(:ftype)');
    dm.ibq.ParamByName('ftype').AsString := current_flow;
    dm.ibq.Open;
    while not dm.ibq.Eof do begin
        NewItem := lsvFlow.Items.Add;
        NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;
        NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);
        dm.ibq.Next;
    end;
    lsvFlow.Items.EndUpdate;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;

end;



procedure TFormFlowAdmin.FormShow(Sender: TObject);
begin
    Initialize;
end;

procedure TFormFlowAdmin.cboTypeChange(Sender: TObject);
begin
    if cboType.Items.Count <> 0 then
        current_flow := cboType.Items.Strings[cboType.itemIndex];
    Refresh;

end;

procedure TFormFlowAdmin.SpeedButton2Click(Sender: TObject);
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;


        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('select * from INSERT_FLOW_TYPE(:ftype)');
        dm.ibq.ParamByName('ftype').AsString := cboType.Text;
        dm.ibq.Open;

        if dm.ibq.Fields.FieldByName('success').AsInteger = 1 then begin
            Initialize;
            // no steps should appear
        end
        else begin
            // unsuccessful because flow_type is existing, do nothing
        end;

    if dm.ibt.InTransaction then
        dm.ibt.Commit;

end;

end.
