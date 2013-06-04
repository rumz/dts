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
  end;

var
  FormLogin: TFormLogin;

implementation

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
    if dm.ibt.InTransaction then
        dm.ibt.Commit
    else
        dm.ibt.StartTransaction;

    dm.ibq.SQL.Clear;

    dm.ibq.SQL.Add('select f_name || ' ' || l_name from SELECT_RIVS(:a, :b)');
    dm.ibq.Params[0].AsInteger := 0;
    dm.ibq.Params[1].AsString := '%' + EditRIVSearch.Text;
    dm.ibq.Open;


end;

end.
