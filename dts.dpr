program dts;

{%File 'db\piss-sp.sql'}
{%File 'db\piss.sql'}
{%File 'db\piss-data.txt'}
{%File 'db\piss-triggers.sql'}

uses
  Forms,
  main in 'main.pas' {FormMain},
  data_module in 'data_module.pas' {dm: TDataModule},
  riv in 'riv.pas' {FormRIV},
  login in 'login.pas' {FormLogin},
  process in 'process.pas' {FormProcess},
  shared in 'shared.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormRIV, FormRIV);
  Application.CreateForm(TFormProcess, FormProcess);
  Application.Run;
end.
