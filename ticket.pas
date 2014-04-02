unit ticket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type

  TUser = record
    name : string[50];
    id_no : string[20];
  end;

  TFormTicket = class(TForm)
    Label1: TLabel;
    Memo_RIV_Description: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    cboCategory: TComboBox;
    Label4: TLabel;
    cboUser: TComboBox;
    procedure loadElements;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTicket: TFormTicket;
  users : array of TUser;
  id_nos, names : array of String;

implementation

uses data_module;

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


procedure TFormTicket.loadElements;
var
    i : integer;
begin
    // FIRST LOAD CATEGORIES
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select name from Category order by name');
    dm.ibq.Open;

    cboCategory.Items.BeginUpdate;
    cboCategory.Items.Clear;
    while not dm.ibq.Eof do begin
        cboCategory.Items.Add(dm.ibq.Fields.Fields[0].AsString);
        dm.ibq.Next;
    end;
    cboCategory.Items.EndUpdate;
    dm.ibt.Commit;

    // SECOND LOAD USERS
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;
    dm.ibq.SQL.Add('select ID_NO, Last_name, first_name from SELECT_USERS order by last_name');
    dm.ibq.Open;
    cboUser.Items.BeginUpdate;
    cboUser.Items.Clear;
    i := 0;
    while not dm.ibq.Eof do begin
        SetLength(id_nos, i+1);
        SetLength(names, i+1);
        SetLength(users, i+1);

        with users[i] do begin
           id_no := dm.ibq.Fields.Fields[0].AsString;
           name  := dm.ibq.Fields.Fields[1].AsString + ', ' + dm.ibq.Fields.Fields[2].AsString;
        end;

        cboUser.Items.Add(users[i].name);
        dm.ibq.Next;
        i := i + 1;
    end;
    cboUser.Items.EndUpdate;
    dm.ibt.Commit;
end;



procedure TFormTicket.FormShow(Sender: TObject);
begin
    loadElements;
end;

end.
