unit comment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormComment = class(TForm)
    MemoComment: TMemo;
    cboDefectUser: TComboBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cboAssignedUser: TComboBox;
    Label2: TLabel;
    procedure LoadUsers;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormComment: TFormComment;

implementation

uses data_module, shared, DB, main, ticket;

{$R *.dfm}

procedure TFormComment.LoadUsers;
var
    i : integer;
begin
    { LOAD ELEMENTS FROM SHARED SPACE }

    { assigned user } 

    cboAssignedUser.Items.BeginUpdate;
    cboAssignedUser.Items.Clear;
    i := 0;
    while i < Length(shared.users) do begin
        cboAssignedUser.Items.Add(shared.users[i].name);
        i := i + 1;
    end;
    cboAssignedUser.Items.EndUpdate;

    { defect user }

    cboDefectUser.Items.BeginUpdate;
    cboDefectUser.Items.Clear;
    i := 0;
    while i < Length(shared.users) do begin
        cboDefectUser.Items.Add(shared.users[i].name);
        i := i + 1;
    end;
    cboDefectUser.Items.EndUpdate;

    
end;



procedure TFormComment.FormShow(Sender: TObject);
begin
    LoadUsers;
    MemoComment.Lines.Clear;
end;

procedure TFormComment.BitBtn1Click(Sender: TObject);
begin

    if trim(MemoComment.Text) <> '' then
    begin

        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('execute procedure update_comment(:id, :user_id, :ticket_id, :comment, :defect_user, :created)');
		dm.ibq.ParamByName('id').AsInteger := 0;  { 0 autogenerate new id, -1 delete }
		dm.ibq.ParamByName('user_id').AsString := CurrentUser;
    	dm.ibq.ParamByName('ticket_id').AsInteger := ticket_data.id;
	    dm.ibq.ParamByName('comment').AsString := trim(MemoComment.Text);

        if cboDefectUser.ItemIndex <> -1 then
    	    dm.ibq.ParamByName('defect_user').AsString := shared.users[cboDefectUser.ItemIndex].id_no
        else
            dm.ibq.ParamByName('defect_user').AsString := '';
		dm.ibq.ParamByName('created').AsDateTime := Now;
		dm.ibq.ExecSQL;

        Close;
        FormTicket.loadComments;


    end;
end;

end.
