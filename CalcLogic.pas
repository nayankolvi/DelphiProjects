unit CalcLogic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections;

type
  CalculatorLogic = class
    private

    public
      function PerformOperation (op1: Extended; op2 : Extended; op : Char): Extended;
      function CalculateResult(Data : TList<string>): string;
      function CheckIfOperatorFound(Data : TList<string>; Op : Char): Integer;

    end;

implementation

// do the basic operations on the operands
function CalculatorLogic.PerformOperation (op1: Extended; op2 : Extended; op : Char): Extended;
begin
  case op of
  '+': Result := op1 + op2;
  '-': Result := op1 - op2;
  '*': Result := op1 * op2;
  '/': Result := op1 / op2;
  end;
end;



function CalculatorLogic.CalculateResult(Data : TList<string>): string;
var
  OpId, OpIndexInArray :Integer;
  OpResult :string;
  OpArray: array of Char;

begin
  OpArray := ['/', '*', '+', '-'];
  // use "BODMAS" rules to perform operation
  // Intially go from right to left replace all the operations of the same
  // todo : Handle exceptions
  if Data.Count = 0 then
    begin
      Result := '';
      Exit;
    end
  else
    begin
      for OpId := Low(OpArray) to High(OpArray) do
        begin
          OpIndexInArray :=  CheckIfOperatorFound(Data, OpArray[OpId]);
          while OpIndexInArray <> -1 do
          begin
            OpResult := FloatToStr(performOperation(StrToFloat(Data[OpIndexInArray-1]), StrToFloat(Data[OpIndexInArray+1]), OpArray[OpId]));
            if Data.Count > 3 then
              begin
                Data.DeleteRange(OpIndexInArray-1, 3);
                Data.Insert(OpIndexInArray-1, OpResult);
              end
            else
              begin
                Data.DeleteRange(OpIndexInArray-1, 3);
                Data.Insert(OpIndexInArray-1, OpResult);
                Result := OpResult;
                Exit;
              end;
            OpIndexInArray :=  CheckIfOperatorFound(Data, OpArray[OpId]);
          end;
        end;
    end;
end;




function CalculatorLogic.CheckIfOperatorFound(Data : TList<string>; Op : Char): Integer;
begin
  Result := Data.IndexOf(Op);
end;

end.
