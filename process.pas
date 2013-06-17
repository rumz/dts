unit process;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormProcess = class(TForm)
    cbo_approve: TComboBox;
    TabControl1: TTabControl;
    lsvRIVtransactions: TListView;
    Label1: TLabel;
    Label2: TLabel;
    MemoRemarks: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProcess: TFormProcess;

implementation

{$R *.dfm}

end.
