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

  TCategory = record
    name : string[100];
    id : integer;
  end;


  TFormTicket = class(TForm)
    Label1: TLabel;
    Memo_Description: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    edtSubject: TEdit;
    Label3: TLabel;
    cboCategory: TComboBox;
    Label4: TLabel;
    cboUser: TComboBox;
    procedure loadElements;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTicket: TFormTicket;
  users : array of TUser;
  categories : array of TCategory;
  id_nos, names : array of String;

implementation

uses data_module, shared, DB, main;

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


procedure TFormTicket.BitBtn2Click(Sender: TObject);
begin
    Close;
end;


procedure TFormTicket.loadElements;
var
    i : integer;
begin
    { LOAD ELEMENTS FROM SHARED SPACE - THIS IS CALLED FROM MAIN FORM}

    { FIRST LOAD CATEGORIES }
    cboCategory.Items.BeginUpdate;
    cboCategory.Items.Clear;
    i := 0;
    while i < Length(shared.categories) do begin
        cboCategory.Items.Add(shared.categories[i].name);
        i := i + 1;
    end;
    cboCategory.Items.EndUpdate;

    { SECOND LOAD USERS } 
    cboUser.Items.BeginUpdate;
    cboUser.Items.Clear;
    i := 0;
    while i < Length(shared.users) do begin
        cboUser.Items.Add(shared.users[i].name);
        i := i + 1;
    end;
    cboUser.Items.EndUpdate;
end;


procedure TFormTicket.FormShow(Sender: TObject);
begin

    if shared.ticket_form_state = 'Add' then begin
        edtSubject.Text := '';
        Memo_Description.Text := '';
    end
    else if shared.ticket_form_state = 'Update' then begin
{        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('');}

    end
end;


procedure TFormTicket.BitBtn1Click(Sender: TObject);
var
    form_validated : Boolean;
begin
    form_validated := False;

    if edtSubject.Text = '' then begin
        ShowMessage('Subject must not be blank.');
        edtSubject.SetFocus;
    end
    else if cboCategory.ItemIndex = -1 then begin
        ShowMessage('Please choose a category.');
        cboCategory.SetFocus;
    end
    else if cboUser.ItemIndex = -1 then begin
        ShowMessage('Please choose a user.');
        cboUser.SetFocus;
    end
    else
        form_validated := True;

    if (form_validated) then begin

		if dm.ibt.InTransaction then
			dm.ibt.Commit
		else
			dm.ibt.StartTransaction;

		dm.ibq.SQL.Clear;
		dm.ibq.SQL.Add('execute procedure update_ticket(:id, :subject, :description, :is_open, :priority, :category_id, :user_id, :created, :modified)');
        if riv_form_state = 'Add' then
            dm.ibq.ParamByName('id').AsInteger := 0
        else
            dm.ibq.ParamByName('id').AsInteger := shared.ticket_id;
        dm.ibq.ParamByName('subject').AsString := edtSubject.text;
        dm.ibq.ParamByName('description').AsString := Memo_Description.Text;
        dm.ibq.ParamByName('is_open').AsInteger := 1;
        dm.ibq.ParamByName('priority').AsInteger := 1;
        dm.ibq.ParamByName('category_id').AsInteger := categories[cboCategory.ItemIndex].id;
        dm.ibq.ParamByName('user_id').AsString := users[cboUser.ItemIndex].id_no;
        dm.ibq.ParamByName('created').AsDateTime := Now;
        dm.ibq.ParamByName('modified').AsDateTime := Now;
        dm.ibq.ExecSQL;

        Close;
        FormMain.lsvRefresh;
    end;
end;

end.
