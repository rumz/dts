unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormLogin = class(TForm)
    leduser: TLabeledEdit;
    ledpass: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cboDB: TComboBox;
    Label1: TLabel;
    function ConnectDB:Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppExit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
end;

var
  FormLogin: TFormLogin;

implementation

uses data_module, main, shared;

{$R *.dfm}

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Exit;
end;

procedure TFormLogin.AppExit;
begin
    Close;
end;


function TFormLogin.ConnectDB:Boolean;
begin
    if dm.ibd.Connected = False then begin
        // dm.ibd.DatabaseName := trim(ledServer.Text) + ':' + trim(ledPath.Text);
        // Sample: 172.22.16.6:h:\databases\pipers ii\dts.gdb

        dm.ibd.DatabaseName := cboDB.Text;
        dm.ibd.Connected := True;
    end;
    Result := dm.ibd.Connected;
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
    if ConnectDB then begin
        shared.CurrentUser.name := '';
        shared.CurrentUser.id_no := trim(leduser.Text);

        if dm.ibt.InTransaction then
            dm.ibt.Commit
        else
            dm.ibt.StartTransaction;

        dm.ibq.SQL.Clear;

        dm.ibq.SQL.Add('select * from login(:a, :b)');
        dm.ibq.Params[0].AsString := leduser.Text;
        dm.ibq.Params[1].AsString := ledpass.Text;
        dm.ibq.Open;

        if dm.ibq.Eof then
        begin
            MessageDlg('Incorrect Password. Try Again.', mtWarning, mbOKCancel, 1)
        end
        else
        begin
            while not dm.ibq.Eof do begin
                shared.CurrentUser.id_no := leduser.Text;
                FormMain.StatusBar1.Panels.Items[0].Text := '  ' + leduser.Text;
                FormMain.StatusBar1.Panels.Items[1].Text := '  ' + dm.ibq.Fields.Fields[0].AsString;

                dm.ibq.Next;
            end;
            FormMain.Show;
            FormLogin.Hide;
        end
    end;
end;


procedure TFormLogin.FormShow(Sender: TObject);
begin
    leduser.Text := '';
    ledpass.Text := '';
    leduser.SetFocus;
    
end;

end.
