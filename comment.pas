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
    cboAssignedUser.Clear;
    cboDefectUser.Clear;
    LoadUsers;
    MemoComment.Lines.Clear;
    cboAssignedUser.ItemIndex := -1;
    cboDefectUser.ItemIndex   := -1;

end;

procedure TFormComment.BitBtn1Click(Sender: TObject);
var
    comment : string;
begin

    if trim(MemoComment.Text) <> '' then
    begin

        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        {

        todo update the comment to reflect if user was updated
        update user via update_ticket SP

        }

        {
		dm.ibq.SQL.Clear;
		dm.ibq.SQL.Add('execute procedure update_ticket(:id, :subject, :description, :is_open, :priority, :category_id, :user_id, :requester, :created, :modified)');
        if ticket_form_state = 'Add' then
            dm.ibq.ParamByName('id').AsInteger := 0
        else
            dm.ibq.ParamByName('id').AsInteger := ticket_data.id;
        dm.ibq.ParamByName('subject').AsString := trim(edtSubject.text);
        dm.ibq.ParamByName('description').AsString := trim(Memo_Description.Text);       }

        { 0 closed, 1 open
        if chkbox_isOpen.Checked then
            dm.ibq.ParamByName('is_open').AsInteger := 0
        else
            dm.ibq.ParamByName('is_open').AsInteger := 1;

        dm.ibq.ParamByName('priority').AsInteger := 1;
        dm.ibq.ParamByName('category_id').AsInteger := shared.categories[cboCategory.ItemIndex].id;
        dm.ibq.ParamByName('user_id').AsString := shared.users[cboUser.ItemIndex].id_no;
        dm.ibq.ParamByName('requester').AsString := shared.users[cboRequester.ItemIndex].id_no;
        dm.ibq.ParamByName('created').AsDateTime := Now;      // SP doesnt use this when in UPDATE mode 
        dm.ibq.ParamByName('modified').AsDateTime := Now;
        dm.ibq.ExecSQL;   }

                                    {
        comment := 'User ' + shared.users[findindex(CurrentUser)].name + ' made change(s): ';
        if (ticket_data.user_id <> shared.users[cboAssignedUser.ItemIndex].id_no) then begin
            if shared.users[cboUser.ItemIndex].id_no <> user_id then
			    comment := comment + sLineBreak + 'ASSIGNED USER: ' + shared.users[cboUser.ItemIndex].name;
        end                        }

        dm.ibq.SQL.Clear;
        dm.ibq.SQL.Add('execute procedure update_comment(:id, :user_id, :ticket_id, :comment, :defect_user, :created)');
		dm.ibq.ParamByName('id').AsInteger := 0;  { 0 autogenerate new id, -1 delete }
		dm.ibq.ParamByName('user_id').AsString := CurrentUser;
    	dm.ibq.ParamByName('ticket_id').AsInteger := ticket_data.id;

        comment := comment + trim(MemoComment.Text);
        if cboDefectUser.ItemIndex <> -1 then begin
    	    dm.ibq.ParamByName('defect_user').AsString := shared.users[cboDefectUser.ItemIndex].id_no;
        end
        else
            dm.ibq.ParamByName('defect_user').AsString := '';
  	    dm.ibq.ParamByName('comment').AsString := comment;
		dm.ibq.ParamByName('created').AsDateTime := Now;
		dm.ibq.ExecSQL;

        Close;
        FormTicket.loadComments;
    end
    else begin
        ShowMessage('Comment text must not be blank.');
        MemoComment.SetFocus;
    end;
end;

end.
