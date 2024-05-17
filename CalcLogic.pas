unit CalcLogic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections;

type
  TCalculator = class(TList<string>)
  private
    function GetOperatorIndex(Op: Char): Integer;
    function PerformOperation(op1: Extended; op2 : Extended; op : Char): Extended;
  public
    function CalculateResult: string;
  end;

implementation

function TCalculator.CalculateResult: string;
const
//  OpArray: Array[0..3] of Char = ('/', '*', '+', '-');
  OpArray: TArray<Char> = ['/', '*', '+', '-'];
var
  OpIndex :Integer;
  OpResult :string;

begin
  // use "BODMAS" rules to perform operation
  // Intially go from right to left replace all the operations of the same
  // todo : Handle exceptions
  if Count = 0 then
    begin
      Result := '';
      Exit;
    end
  else
    begin
      for var Op in OpArray do
        begin
          OpIndex :=  GetOperatorIndex(Op);
          while OpIndex <> -1 do
          begin
            OpResult := FloatToStr(performOperation(StrToFloat(Items[OpIndex-1]), StrToFloat(Items[OpIndex+1]), Op));
            if Count > 3 then
              begin
                DeleteRange(OpIndex-1, 3);
                Insert(OpIndex-1, OpResult);
              end
            else
              begin
                DeleteRange(OpIndex-1, 3);
                Insert(OpIndex-1, OpResult);
                Result := OpResult;
                Exit;
              end;
            OpIndex :=  GetOperatorIndex(Op);
          end;
        end;
    end;
end;

function TCalculator.GetOperatorIndex(Op: Char): Integer;
begin
  Result := IndexOf(Op);
end;

// do the basic operations on the operands
function TCalculator.PerformOperation(op1: Extended; op2 : Extended; op : Char): Extended;
begin
  case op of
  '+': Result := op1 + op2;
  '-': Result := op1 - op2;
  '*': Result := op1 * op2;
  '/': Result := op1 / op2;
  end;
end;

end.
