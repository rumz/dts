unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TCustomSortStyle = (cssAlphaNum, cssNumeric, cssDateTime);

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
    procedure lsvRIV2ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    NewItem, CurrentRIV : TListItem;
  end;


{ custom sort styles }


var
  FormMain: TFormMain;

  { variable to hold the sort style }
  LvSortStyle: TCustomSortStyle;
  { array to hold the sort order }
  LvSortOrder: array[0..4] of Boolean; // High[LvSortOrder] = Number of Lv Columns



implementation

uses data_module, item_library, riv, login, process, shared;

{$R *.dfm}


function CustomSortProc(Item1, Item2: TListItem; SortColumn: Integer): Integer; stdcall;
var
  s1, s2: string;
  i1, i2: Integer;
  r1, r2: Boolean;
  d1, d2: TDateTime;

  { Helper functions }

  function IsValidNumber(AString : string; var AInteger : Integer): Boolean;
  var
    Code: Integer;
  begin
    Val(AString, AInteger, Code);
    Result := (Code = 0);
  end;

  function IsValidDate(AString : string; var ADateTime : TDateTime): Boolean;
  begin
    Result := True;
    try
      ADateTime := StrToDateTime(AString);
    except
      ADateTime := 0;
      Result := False;
    end;
  end;

  function CompareDates(dt1, dt2: TDateTime): Integer;
  begin
    if (dt1 > dt2) then Result := 1
    else
      if (dt1 = dt2) then Result := 0
    else
      Result := -1;
  end;

  function CompareNumeric(AInt1, AInt2: Integer): Integer;
  begin
    if AInt1 > AInt2 then Result := 1
    else
      if AInt1 = AInt2 then Result := 0
    else
      Result := -1;
  end;

begin
  Result := 0;

  if (Item1 = nil) or (Item2 = nil) then Exit;

  case SortColumn of
    -1 :
    { Compare Captions }
    begin
      s1 := Item1.Caption;
      s2 := Item2.Caption;
    end;
    else
    { Compare Subitems }
    begin
      s1 := '';
      s2 := '';
      { Check Range }
      if (SortColumn < Item1.SubItems.Count) then
        s1 := Item1.SubItems[SortColumn];
      if (SortColumn < Item2.SubItems.Count) then
        s2 := Item2.SubItems[SortColumn]
    end;
  end;

  { Sort styles }

  case LvSortStyle of
    cssAlphaNum : Result := lstrcmp(PChar(s1), PChar(s2));
    cssNumeric  : begin
                    r1 := IsValidNumber(s1, i1);
                    r2 := IsValidNumber(s2, i2);
                    Result := ord(r1 or r2);
                    if Result <> 0 then
                      Result := CompareNumeric(i2, i1);
                  end;
    cssDateTime : begin
                    r1 := IsValidDate(s1, d1);
                    r2 := IsValidDate(s2, d2);
                    Result := ord(r1 or r2);
                    if Result <> 0 then
                      Result := CompareDates(d1, d2);
                  end;
  end;

  { Sort direction }

  if LvSortOrder[SortColumn + 1] then
    Result := - Result;
end;




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
          NewItem.Caption := dm.ibq.Fields.Fields[0].AsString;      // id
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[1].AsString);   // riv_no
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[2].AsString);   // requestor
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[3].AsString);   // requestor_name
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[4].AsString);   // description
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[5].AsString);   // create_date
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[6].AsString);   // status
          NewItem.SubItems.Add(dm.ibq.Fields.Fields[7].AsString);   // remarks
          dm.ibq.Next;
      end;
      lsvRIV2.Items.EndUpdate;
    end;
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
    dm.ibq.SQL.Add('execute procedure update_rivs(:id, :b, :c, :d, :e, :f, :g, :h, :i)');
    dm.ibq.Params[0].AsInteger := strtoint(CurrentRIV.Caption) * -1;
    dm.ibq.Params[1].AsString := '';
    dm.ibq.Params[2].AsString := '';
    dm.ibq.Params[3].AsString := '';
    dm.ibq.Params[4].AsDateTime := Now;
    dm.ibq.Params[5].AsString := '';
    dm.ibq.Params[6].AsInteger := 1;  // current_step = 2
    dm.ibq.Params[7].AsString := '';
    dm.ibq.Params[8].AsString := '';

    dm.ibq.Prepare;
    dm.ibq.ExecSQL;
    if dm.ibt.InTransaction then
        dm.ibt.Commit;
    lsvRefresh;
end;



procedure TFormMain.UpdateRecord1Click(Sender: TObject);
begin
    shared.riv_form_state := 'Update';
    FormRIV.led_ID.Text := CurrentRIV.Caption;
    FormRIV.led_rivno.Text := CurrentRIV.SubItems.Strings[0];
    FormRIV.cbo_Requestor.Text := CurrentRIV.SubItems.Strings[1];

    FormRIV.Memo_RIV_Description.Lines.Clear;
    FormRIV.Memo_RIV_Description.Lines.Text := CurrentRIV.SubItems.Strings[3];
    FormRIV.Memo_Remarks.Lines.Text := CurrentRIV.SubItems.Strings[6];
    FormRIV.ShowModal;
end;

procedure TFormMain.AddRecord1Click(Sender: TObject);
begin
    shared.riv_form_state := 'Add';
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
    if (CurrentRIV <> nil) then
    begin
{        if trim(CurrentRIV.SubItems.Strings[1]) = trim(StatusBar1.Panels.Items[0].Text) then
            ProcessRecord1.Enabled := True
        else
            ProcessRecord1.Enabled := False;
}
    end

end;

procedure TFormMain.ProcessRecord1Click(Sender: TObject);
begin
    shared.riv_id := strtoint(CurrentRIV.Caption);
    shared.riv_no := CurrentRIV.SubItems.Strings[0];
    shared.riv_description := CurrentRIV.SubItems.Strings[3];
    FormProcess.ShowModal;
end;

procedure TFormMain.lsvRIV2ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  { determine the sort style }
  if (Column.Index = 0) or (Column.Index = 2) then
    LvSortStyle := cssNumeric
  else
    LvSortStyle := cssAlphaNum;

  { Call the CustomSort method }
  lsvRIV2.CustomSort(@CustomSortProc, Column.Index -1);

  { Set the sort order for the column}
  LvSortOrder[Column.Index] := not LvSortOrder[Column.Index];
end;

end.



