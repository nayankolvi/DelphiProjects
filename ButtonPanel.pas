unit ButtonPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

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
    { Private declarations }
    lastClicked: char;

  public
    { Public declarations }
    function getLastClick(): char;

  end;

implementation

{$R *.dfm}

procedure TButtons.ButtonClick(Sender: TObject);
begin
  if Sender = ButtonOne then
    lastClicked := '1'
  else if Sender = ButtonTwo then
    lastClicked := '2'
  else if Sender = ButtonThree then
    lastClicked := '3'
  else if Sender = ButtonFour then
    lastClicked := '4'
  else if Sender = ButtonFive then
    lastClicked := '5'
  else if Sender = ButtonSix then
    lastClicked := '6'
  else if Sender = ButtonSeven then
    lastClicked := '7'
  else if Sender = ButtonEight then
    lastClicked := '8'
  else if Sender = ButtonNine then
    lastClicked := '9'
  else if Sender = ButtonZero then
    lastClicked := '0'
  else if Sender = ButtonPlus then
    lastClicked := '+'
  else if Sender = ButtonMinus then
    lastClicked := '-'
  else if Sender = ButtonMul then
    lastClicked := '*'
  else if Sender = ButtonDiv then
    lastClicked := '/'
  else if Sender = ButtonEqu then
    lastClicked := '='
  else
    lastClicked := ' ';
end;

function TButtons.getLastClick(): char;
begin
  result := lastClicked;
end;

end.
