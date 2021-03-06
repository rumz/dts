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
    leddescription: TLabeledEdit;
    cboRights: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label1: TLabel;
    procedure Initialize;
    procedure Refresh;
    procedure SaveFlowType;
    procedure SaveFlowStep;
    procedure FormShow(Sender: TObject);
    procedure cboTypeChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lsvFlowSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem, CurrentStep : TListItem;
    current_flow : string;
    action : string;
  end;

var
  FormFlowAdmin: TFormFlowAdmin;

implementation

uses data_module, main, shared, DB;


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


procedure TFormFlowAdmin.SaveFlowType;
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

procedure TFormFlowAdmin.SaveFlowStep;
begin
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    // if action = insert then id = 0
    // if action = update then id = id of current item
    // if action = delete then id = id of current item or the last item in the list



    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('execute procedure UPDATE_FLOW_LIB(:ftype, :id, :rights, :description)');
    dm.ibq.ParamByName('ftype').AsString  := cboType.Text;
    dm.ibq.ParamByName('id').AsInteger    := 0;
    dm.ibq.ParamByName('rights').AsString := cboRights.Text;
    dm.ibq.ParamByName('description').AsString := leddescription.Text;
    dm.ibq.Open;

    Initialize;
    // saved steps should appear or be removed depending action

    if dm.ibt.InTransaction then
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
        NewItem.Caption := dm.ibq.FieldValues['rights'];      // rights
        NewItem.SubItems.Add(dm.ibq.FieldValues['id']);   // id
        NewItem.SubItems.Add(dm.ibq.FieldValues['description']);   // description
        dm.ibq.Next;
    end;
    lsvFlow.Items.EndUpdate;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;

end;



procedure TFormFlowAdmin.FormShow(Sender: TObject);
begin
    Initialize;
    if cboType.Items.Count <> 0 then
        cboType.ItemIndex := 0;

    Refresh;
end;

procedure TFormFlowAdmin.cboTypeChange(Sender: TObject);
begin
    if cboType.Items.Count <> 0 then
        current_flow := cboType.Items.Strings[cboType.itemIndex];
    Refresh;
end;

procedure TFormFlowAdmin.SpeedButton2Click(Sender: TObject);
begin
    SaveFlowType;
end;

procedure TFormFlowAdmin.BitBtn1Click(Sender: TObject);
begin
    if (leddescription.Text <> '') and (cboRights.ItemIndex >= 0) then begin
        // if no entries, add entry
        // if entries exist and no selected entry, add to end of list
        // if entry is selected and description or right is changed, update entry
        // if entries exist and entry is selected, add new entry after selected entry
        SaveFlowStep;
        Refresh;
    end
    else begin
        if leddescription.Text = '' then begin
            MessageDlg('Description must not be empty.', mtError, mbOKCancel, 1);
            leddescription.SetFocus;
        end
        else if cboRights.ItemIndex < 0 then begin
            MessageDlg('Choose needed user Rights.', mtWarning, mbOKCancel, 1);
            cboRights.SetFocus;
        end
    end;
end;

procedure TFormFlowAdmin.lsvFlowSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
{    MessageDlg(Item.Caption, mtInformation, mbOKCancel, 1);
    MessageDlg(Item.SubItems[0], mtInformation, mbOKCancel, 1);
    MessageDlg(Item.SubItems[1], mtInformation, mbOKCancel, 1);
}
    CurrentStep := Item;
    action := 'update';

//    leddescription.Text := CurrentStep.SubItems.Strings[1];
//    cboRights.ItemIndex := cboRights.Items.IndexOfName(CurrentStep.Caption);

end;

end.
