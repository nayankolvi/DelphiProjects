program CalcProj;

uses
  Vcl.Forms,
  CalcForm in 'CalcForm.pas' {CalculatorForm},
  ButtonPanel in 'ButtonPanel.pas' {Buttons: TFrame},
  DisplayPanel in 'DisplayPanel.pas' {Display: TFrame},
  CalcLogic in 'CalcLogic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCalculatorForm, CalculatorForm);
  Application.Run;
end.
