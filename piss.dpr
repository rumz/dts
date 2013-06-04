program piss;

{%File 'db\piss-sp.sql'}
{%File 'db\piss.sql'}
{%File 'db\piss-data.txt'}
{%File 'db\piss-triggers.sql'}

uses
  Forms,
  main in 'main.pas' {FormMain},
  data_module in 'data_module.pas' {dm: TDataModule},
  item_library in 'item_library.pas' {FormItemLibrary},
  riv in 'riv.pas' {FormRIV},
  login in 'login.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormItemLibrary, FormItemLibrary);
  Application.CreateForm(TFormRIV, FormRIV);
  Application.Run;
end.
