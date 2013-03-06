program piss;

{%File 'db\piss-sp.sql'}
{%File 'db\piss.sql'}
{%File 'db\piss-data.txt'}
{%File 'db\piss-triggers.sql'}

uses
  Forms,
  main in 'main.pas' {FormMain},
  data_module in 'data_module.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
