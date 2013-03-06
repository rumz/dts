unit dm;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase;

type
  Tdm1 = class(TDataModule)
    ibd: TIBDatabase;
    ibt: TIBTransaction;
    ibq: TIBQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}

procedure Tdm1.DataModuleCreate(Sender: TObject);
begin
    ibd.Connected := True; 
end;

end.
