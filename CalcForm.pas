unit CalcForm;

{$R *.dfm}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ButtonPanel, DisplayPanel, CalcLogic;

type
  TCalculator = class(TForm)
    Buttons: TButtons;
    Display: TDisplay;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OnButtonEvent(Sender: TObject);

  private
    Data : TList<string>;
    Logic: CalculatorLogic;

  public
    { Public declarations }
    function StoreDataAndGetDisplayString(CurrentValue : Char) : string;
  end;

var
  Calculator: TCalculator;

implementation




procedure TCalculator.FormCreate(Sender: TObject);
begin
   Data := TList<string>.Create;
   CalculatorLogic.Create;
end;


procedure TCalculator.OnButtonEvent(Sender: TObject);
var
  newData : Char;
begin
  // send button event
  Buttons.ButtonClick(Sender);
  // Store latest button data and display it on the screen
  newData := Buttons.getLastClick;
  // in case of clear
  if newData = ' ' then
    begin
      Data.Clear;
      Display.SetDisplayText('');
    end
  // in case of operantion and operands
  else if newData <> '=' then
    Display.SetDisplayText(StoreDataAndGetDisplayString(newData))
  // in case of calculation
  else
    Display.SetDisplayText(Logic.CalculateResult(Data));
end;


procedure TCalculator.FormDestroy(Sender: TObject);
begin
  Data.Destroy;
end;


function TCalculator.StoreDataAndGetDisplayString(CurrentValue : Char) : string;
var
  OperationArray : string;
begin
  OperationArray :=  '+*-/';

  // when first data is being added to the operator and operation list
  if Data.Count = 0 then
  begin
    Data.Add(CurrentValue);
    Result := CurrentValue;
  end
  // add digits next to each other for multiple entries and seperate the operations
  else if OperationArray.Contains(CurrentValue) then
  begin
    // add new operation
    Data.Add(CurrentValue);
    Result := Display.GetDisplayText + ' ' + CurrentValue + ' ';
    // create new numerical slot
    Data.Add('');
  end
  else
  begin
    Data[Data.Count - 1] := Data[Data.Count - 1] + CurrentValue;
    Result := Display.GetDisplayText + CurrentValue;
  end;
end;


end.
