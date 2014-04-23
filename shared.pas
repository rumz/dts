unit shared;

interface

uses ComCtrls, SysUtils, Windows;

function CustomSortProc(Item1, Item2: TListItem; SortColumn: Integer): Integer; stdcall;
function findindex(item : string):integer;



type
  TCustomSortStyle = (cssAlphaNum, cssNumeric, cssDateTime);

  TUser = record
    name : string[50];
    id_no : string[20];
  end;

  TCategory = record
    name : string[100];
    id : integer;
  end;


var
    CurrentUser: TUser;
    users: array of TUser;
    categories: array of TCategory;

    main_form_state, riv_form_state, ticket_form_state : String;
    riv_id, ticket_id : integer;
    riv_no, riv_rights, riv_description : string;
    ftype : string;



    loginas, loginaspass, loginasrights, loginasuserid : string;


  { variable to hold the sort style }
  LvSortStyle: TCustomSortStyle;
  { array to hold the sort order }
  LvSortOrder: array[0..10] of Boolean; // High[LvSortOrder] = Number of Lv Columns


implementation


function findIndex(item : string):integer;
var i : integer;
begin
    for i := Low(users) to High(users) do begin
        if AnsiSameText(item, users[i].id_no) then begin
            Result := i;
            Break;
        end;
    end;
end;




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


end.
