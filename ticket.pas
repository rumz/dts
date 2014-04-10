unit ticket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type

  TUser = record
    name  : string[50];
    id_no : string[20];
  end;

  TCategory = record
    name  : string[100];
    id    : integer;
  end;

  TTicket = record
    id          : integer;
    subject     : string[200];
    description : string[255];
    is_open     : integer;
    priority    : integer;
    category_id : integer;
    user_id     : string[16];
    requester   : string[16];
    created     : TDateTime;
    modified    : TDateTime;
  end;

  TFormTicket = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    edtSubject: TEdit;
    Label2: TLabel;
    Memo_Description: TMemo;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cboCategory: TComboBox;
    cboUser: TComboBox;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    lsvComments: TListView;
    btnComment: TBitBtn;
    chkbox_isOpen: TCheckBox;
    Label5: TLabel;
    cboRequester: TComboBox;
    chkboxDonotcloseonSave: TCheckBox;
    MemoComments: TMemo;
    procedure loadElements;
    procedure loadComments;
    procedure loadTicket;
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCommentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTicket: TFormTicket;
  users : array of TUser;
  categories : array of TCategory;
  ticket_data : TTicket;
  id_nos, names : array of String;
  NewItem, CurrentItem: TListItem;

implementation

uses data_module, shared, DB, main, comment;

{$R *.dfm}



procedure TFormTicket.btnCancelClick(Sender: TObject);
begin
    Close;
    FormMain.lsvRefresh;    
end;


procedure TFormTicket.loadElements;
var
    i : integer;
begin
    { LOAD ELEMENTS FROM SHARED SPACE - THIS IS CALLED FROM MAIN FORM }

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

    { LOAD REQUESTER USERS }
    cboRequester.Items.BeginUpdate;
    cboRequester.Items.Clear;
    i := 0;
    while i < Length(shared.users) do begin
        cboRequester.Items.Add(shared.users[i].name);
        i := i + 1;
    end;
    cboRequester.Items.EndUpdate;
end;


procedure TformTicket.loadTicket;
begin
    with ticket_data do begin
        edtSubject.Text := subject;
        Memo_Description.Text := description;
        cboUser.ItemIndex := findindex(user_id);
        cboRequester.ItemIndex := findindex(requester);
    end;
end;



procedure TFormTicket.loadComments;
var
    user_name, defect_user_name : string;
begin
	if dm.ibt.InTransaction then
		dm.ibt.Commit
	else
		dm.ibt.StartTransaction;
	dm.ibq.SQL.Clear;
	dm.ibq.SQL.Add('select * from SELECT_COMMENTS(:a) order by created desc');
	dm.ibq.Params[0].AsInteger := ticket_id;
	dm.ibq.Open;

    MemoComments.Lines.BeginUpdate;
    MemoComments.Lines.Clear;
	while not dm.ibq.Eof do begin
        { id, user_id, comment, defect user, created }


		MemoComments.Lines.Add('Date: ' + dm.ibq.Fields.Fields[4].AsString);
        // MemoComments.Lines.Add('Comment id: ' + dm.ibq.Fields.Fields[0].AsString);

   		if dm.ibq.Fields.Fields[1].AsString <> '' then
			user_name := shared.users[shared.findindex(dm.ibq.Fields.Fields[1].AsString)].name
		else
			user_name := '';

        MemoComments.Lines.Add('User: ' + user_name);
		if dm.ibq.Fields.Fields[3].AsString <> '' then begin
			defect_user_name := shared.users[shared.findindex(dm.ibq.Fields.Fields[3].AsString)].name;
    		MemoComments.Lines.Add('Defect user: ' + defect_user_name);
        end
		else
			defect_user_name := '';
        MemoComments.Lines.Add('Comment: ' + dm.ibq.Fields.Fields[2].AsString);
		dm.ibq.Next;
        MemoComments.Lines.Add('');
        MemoComments.Lines.Add('');
    end;
    MemoComments.Lines.EndUpdate;

end;


procedure TFormTicket.FormShow(Sender: TObject);
var
    user_name : string;
begin

    chkbox_isOpen.Checked := False;
    if shared.ticket_form_state = 'Add' then begin
        FormTicket.Caption := 'Open Ticket';
        edtSubject.Text := '';
        Memo_Description.Text := '';
        cboCategory.ItemIndex := -1;
        cboUser.ItemIndex := -1;

        cboRequester.ItemIndex := shared.findindex(CurrentUser);

        chkbox_isOpen.Checked := False;
        lsvComments.Items.Clear;
        chkbox_isOpen.Visible := False;
        btnComment.Visible := False;
        MemoComments.Lines.Clear;
    end
    else if shared.ticket_form_state = 'Update' then begin
        { load comments }
        loadComments;
        chkbox_isOpen.Visible := True;
        btnComment.Visible := True;
    end;
    edtSubject.SetFocus;
end;


procedure TFormTicket.btnSaveClick(Sender: TObject);
var
    form_validated : Boolean;
    comment : string;

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
    else if cboRequester.ItemIndex = -1 then begin
        ShowMessage('Please choose a requester.');
        cboRequester.SetFocus;
    end
    else
        form_validated := True;

    if (form_validated) then begin

		if dm.ibt.InTransaction then
			dm.ibt.Commit
		else
			dm.ibt.StartTransaction;

		dm.ibq.SQL.Clear;
		dm.ibq.SQL.Add('execute procedure update_ticket(:id, :subject, :description, :is_open, :priority, :category_id, :user_id, :requester, :created, :modified)');
        if ticket_form_state = 'Add' then
            dm.ibq.ParamByName('id').AsInteger := 0
        else
            dm.ibq.ParamByName('id').AsInteger := ticket_data.id;
        dm.ibq.ParamByName('subject').AsString := trim(edtSubject.text);
        dm.ibq.ParamByName('description').AsString := trim(Memo_Description.Text);

        { 0 closed, 1 open }
        if chkbox_isOpen.Checked then
            dm.ibq.ParamByName('is_open').AsInteger := 0
        else
            dm.ibq.ParamByName('is_open').AsInteger := 1;

        dm.ibq.ParamByName('priority').AsInteger := 1;
        dm.ibq.ParamByName('category_id').AsInteger := shared.categories[cboCategory.ItemIndex].id;
        dm.ibq.ParamByName('user_id').AsString := shared.users[cboUser.ItemIndex].id_no;
        dm.ibq.ParamByName('requester').AsString := shared.users[cboRequester.ItemIndex].id_no;
        dm.ibq.ParamByName('created').AsDateTime := Now;      { SP doesnt use this when in UPDATE mode }
        dm.ibq.ParamByName('modified').AsDateTime := Now;
        dm.ibq.ExecSQL;

        if ticket_form_state = 'Update' then begin

            {
             check all fields if they have differences with existing ticket data
             if there are changes, add them to the comment
             if no changes, do not make any changes
            }

            with ticket_data do begin
                if    (subject     <> edtSubject.Text)
                   or (Memo_Description.Text <> description)
                   or (category_id <> cboCategory.ItemIndex)
                   or (user_id     <> shared.users[cboUser.ItemIndex].id_no)
                   or (chkbox_isOpen.Checked) then
                begin
    				comment := 'User ' + shared.users[findindex(CurrentUser)].name + ' made change(s): ';
                    if edtSubject.Text <> subject then begin
		    		    comment := comment + 'NEW SUBJECT: "' + trim(edtSubject.Text) + '" OLD SUBJECT: "' + subject + '"';
                        subject := trim(edtSubject.Text);
                    end;
                    if Memo_Description.Text <> description then begin
				        comment := comment + 'NEW DESC: "' + trim(Memo_Description.Text) + '" OLD DESC: "' + description + '"';
                        description := trim(Memo_Description.Text);
                    end;
                    if cboCategory.ItemIndex <> category_id then begin
	    			    comment := comment + sLineBreak + 'CATEGORY: ' +  shared.categories[cboCategory.ItemIndex].name;
                        category_id := shared.categories[cboCategory.ItemIndex].id;
                    end;
                    if shared.users[cboUser.ItemIndex].id_no <> user_id then begin
			    	    comment := comment + sLineBreak + 'ASSIGNED USER: ' + shared.users[cboUser.ItemIndex].name;
                        user_id := shared.users[cboUser.ItemIndex].id_no;
                    end;
                    if chkbox_isOpen.Checked then
                        if chkbox_isOpen.Caption = 'Close Ticket' then begin
                            comment := comment + sLineBreak + 'Ticket Closed at ' + DateToStr(NOW) + ' by ' + shared.users[findindex(CurrentUser)].name;
                            is_open := 0;
                        end
                        else if chkbox_isOpen.Caption = 'Reopen Ticket' then begin
                            comment := comment + sLineBreak + 'Ticket Reopened at ' + DateToStr(NOW) + 'by ' + shared.users[findindex(CurrentUser)].name;
                            is_open := 1;
                        end;

    				dm.ibq.SQL.Clear;
	    			dm.ibq.SQL.Add('execute procedure update_comment(:id, :user_id, :ticket_id, :comment, :defect_user, :created)');
		    		dm.ibq.ParamByName('id').AsInteger := 0;  { 0 autogenerate new id, -1 delete }
			    	dm.ibq.ParamByName('user_id').AsString := CurrentUser;
    				dm.ibq.ParamByName('ticket_id').AsInteger := ticket_data.id;
	    			dm.ibq.ParamByName('comment').AsString := comment;
	    			dm.ibq.ParamByName('defect_user').AsString := '';
		    		dm.ibq.ParamByName('created').AsDateTime := Now;
			    	dm.ibq.ExecSQL;
                end;
            end
        end;

		if dm.ibt.InTransaction then
			dm.ibt.Commit
		else
			dm.ibt.StartTransaction;

        if not chkboxDonotcloseonSave.Checked then begin
            Close;
            FormMain.lsvRefresh;
        end
        else begin
            loadComments;
        end;
    end;
end;

procedure TFormTicket.btnCommentClick(Sender: TObject);
begin
    FormComment.ShowModal;
end;

end.
