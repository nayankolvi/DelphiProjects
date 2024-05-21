unit CalcForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ButtonPanel, DisplayPanel, CalcLogic, Vcl.StdCtrls;

type
  TCalculatorForm = class(TForm)
    Buttons: TButtons;
    Display: TDisplay;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    FData: TCalculator;
    procedure ButtonsInput(Input: Char);
  public
    function StoreDataAndGetDisplayString(CurrentValue : Char) : string;
  end;

var
  CalculatorForm: TCalculatorForm;

implementation

{$R *.dfm}




procedure TCalculatorForm.FormCreate(Sender: TObject);
begin
   FData := TCalculator.Create;
   Buttons.OnInput := ButtonsInput;
end;


procedure TCalculatorForm.FormDestroy(Sender: TObject);
begin
  FData.Free;
end;

procedure TCalculatorForm.ButtonsInput(Input: Char);
begin
  // Store latest button FData and display it on the screen
  // in case of clear
  if Input = ' ' then
    begin
      FData.Clear;
      Display.DisplayText := '';
    end
  // in case of operantion and operands
  else if Input <> '=' then
    Display.DisplayText := StoreDataAndGetDisplayString(Input)
  // in case of calculation
  else
    Display.DisplayText := FData.CalculateResult;
end;


function TCalculatorForm.StoreDataAndGetDisplayString(CurrentValue : Char) : string;
var
  OperationArray : string;
begin
  OperationArray :=  '+*-/';

  // when first FData is being added to the operator and operation list
  if FData.Count = 0 then
  begin
    FData.Add(CurrentValue);
    Result := CurrentValue;
  end
  // add digits next to each other for multiple entries and seperate the operations
  else if OperationArray.Contains(CurrentValue) then
  begin
    // add new operation
    FData.Add(CurrentValue);
    Result := Display.DisplayText + ' ' + CurrentValue + ' ';
    // create new numerical slot
    FData.Add('');
  end
  else
  begin
    FData[FData.Count - 1] := FData[FData.Count - 1] + CurrentValue;
    Result := Display.DisplayText + CurrentValue;
  end;
end;


end.
