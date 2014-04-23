unit loginas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormLoginAs = class(TForm)
    leduser: TLabeledEdit;
    ledpass: TLabeledEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLoginAs: TFormLoginAs;

implementation

uses data_module, shared;

{$R *.dfm}





procedure TFormLoginAs.FormShow(Sender: TObject);
begin
    leduser.Text := '';
    ledpass.Text := '';
    leduser.SetFocus;
end;

procedure TFormLoginAs.BitBtn2Click(Sender: TObject);
begin
    Exit;
end;

procedure TFormLoginAs.BitBtn1Click(Sender: TObject);
begin
    shared.loginaspass := ledpass.Text;
    shared.loginasuserid := leduser.Text;

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
        shared.loginasrights := '';
        while not dm.ibq.Eof do begin
            shared.loginas := dm.ibq.Fields.Fields[0].AsString;
            shared.loginasrights := shared.loginasrights + dm.ibq.Fields.Fields[1].AsString + '|';
            dm.ibq.Next;
        end;

    end

end;

end.
