unit item_library;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormItemLibrary = class(TForm)
    led_IL_id: TLabeledEdit;
    cboType: TComboBox;
    Label1: TLabel;
    ledModel: TLabeledEdit;
    ledDescription: TLabeledEdit;
    Label2: TLabel;
    cboCapex: TComboBox;
    ledCost: TLabeledEdit;
    Button1: TButton;
    ButtonILCancel: TButton;
    procedure ButtonILCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormItemLibrary: TFormItemLibrary;

implementation

{$R *.dfm}

procedure TFormItemLibrary.ButtonILCancelClick(Sender: TObject);
begin
    Close;
    { TODO: ask ronald for code that will check if keypress = VK_ESCAPE and close the form } 
end;



procedure TFormItemLibrary.Button1Click(Sender: TObject);
begin
    { TODO: create code that will update records }
    
end;

end.
