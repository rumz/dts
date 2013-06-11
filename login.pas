unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormLogin = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppExit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    user_name: String;
    rights : String;
end;

var
  FormLogin: TFormLogin;

implementation

uses data_module, main;

{$R *.dfm}

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Exit;
end;

procedure TFormLogin.AppExit;
begin
    Close;
end;







procedure TFormLogin.FormCreate(Sender: TObject);
begin
    FormLogin.KeyPreview := True;
end;

procedure TFormLogin.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TFormLogin.BitBtn1Click(Sender: TObject);
begin
    user_name := '';
    rights := '';


    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

    dm.ibq.SQL.Add('select * from login(:a, :b)');
    dm.ibq.Params[0].AsString := LabeledEdit1.Text;
    dm.ibq.Params[1].AsString := LabeledEdit2.Text;
    dm.ibq.Open;

    if dm.ibq.Eof then
    begin
        MessageDlg('Incorrect Password. Try Again.', mtWarning, mbOKCancel, 1)
    end
    else
    begin
        while not dm.ibq.Eof do begin
            FormMain.CurrentUser := dm.ibq.Fields.Fields[0].AsString;
            FormMain.StatusBar1.Panels.Items[0].Text := '  ' + LabeledEdit1.Text;
            FormMain.StatusBar1.Panels.Items[1].Text := '  ' + dm.ibq.Fields.Fields[0].AsString;
            rights := rights + dm.ibq.Fields.Fields[1].AsString + '|';
            dm.ibq.Next;
        end;
        FormMain.StatusBar1.Panels.Items[2].Text := '  Rights:  ' + rights;
        FormMain.Show;
        FormLogin.Hide;
    end
end;

end.
