unit data_module;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  Tdm = class(TDataModule)
    ibd: TIBDatabase;
    ibt: TIBTransaction;
    ibq: TIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
