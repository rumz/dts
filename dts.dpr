program dts;

{%File 'db\dts-sp.sql'}
{%File 'db\dts-schema.sql'}
{%File 'db\piss-data.txt'}
{%File 'db\dts-triggers.sql'}

uses
  Forms,
  main in 'main.pas' {FormMain},
  data_module in 'data_module.pas' {dm: TDataModule},
  riv in 'riv.pas' {FormRIV},
  login in 'login.pas' {FormLogin},
  process in 'process.pas' {FormProcess},
  shared in 'shared.pas',
  loginas in 'loginas.pas' {FormLoginAs},
  flows in 'flows.pas' {FormFlowAdmin},
  ticket in 'ticket.pas' {FormTicket};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormRIV, FormRIV);
  Application.CreateForm(TFormProcess, FormProcess);
  Application.CreateForm(TFormLoginAs, FormLoginAs);
  Application.CreateForm(TFormFlowAdmin, FormFlowAdmin);
  Application.CreateForm(TFormTicket, FormTicket);
  Application.Run;
end.
