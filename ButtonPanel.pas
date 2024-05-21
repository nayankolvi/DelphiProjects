unit ButtonPanel;

interface

uses
  System.Classes,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls;

type
  TInputEvent = procedure(Input: Char) of object;

type
  TButtons = class(TFrame)
    ButtonOne: TButton;
    ButtonTwo: TButton;
    ButtonThree: TButton;
    ButtonPlus: TButton;
    ButtonFour: TButton;
    ButtonFive: TButton;
    ButtonSix: TButton;
    ButtonMinus: TButton;
    ButtonSeven: TButton;
    ButtonEight: TButton;
    ButtonNine: TButton;
    ButtonMul: TButton;
    ButtonClr: TButton;
    ButtonZero: TButton;
    ButtonEqu: TButton;
    ButtonDiv: TButton;
    procedure ButtonClick(Sender: TObject);
  private
    FOnInput: TInputEvent;
  protected
    procedure DoInput(Input: Char);
  public
    property OnInput: TInputEvent read FOnInput write FOnInput;
  end;

implementation

{$R *.dfm}

procedure TButtons.ButtonClick(Sender: TObject);
var
  Ch: Char;
begin
  if Sender = ButtonOne then
    Ch := '1'
  else if Sender = ButtonTwo then
    Ch := '2'
  else if Sender = ButtonThree then
    Ch := '3'
  else if Sender = ButtonFour then
    Ch := '4'
  else if Sender = ButtonFive then
    Ch := '5'
  else if Sender = ButtonSix then
    Ch := '6'
  else if Sender = ButtonSeven then
    Ch := '7'
  else if Sender = ButtonEight then
    Ch := '8'
  else if Sender = ButtonNine then
    Ch := '9'
  else if Sender = ButtonZero then
    Ch := '0'
  else if Sender = ButtonPlus then
    Ch := '+'
  else if Sender = ButtonMinus then
    Ch := '-'
  else if Sender = ButtonMul then
    Ch := '*'
  else if Sender = ButtonDiv then
    Ch := '/'
  else if Sender = ButtonEqu then
    Ch := '='
  else
    Ch := ' ';
  DoInput(Ch);
end;

procedure TButtons.DoInput(Input: Char);
begin
  if Assigned(FOnInput) then FOnInput(Input);
end;

end.
