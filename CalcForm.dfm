object CalculatorForm: TCalculatorForm
  Left = 0
  Top = 0
  Caption = 'FormCalc'
  ClientHeight = 597
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  inline Buttons: TButtons
    Left = 64
    Top = 134
    Width = 486
    Height = 230
    Color = 16382457
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
  end
  inline Display: TDisplay
    Left = 64
    Top = 56
    Width = 486
    Height = 72
    BiDiMode = bdLeftToRight
    Color = clSilver
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    TabOrder = 1
    inherited DisplayTab: TEdit
      Left = 32
      Top = 16
      Width = 403
    end
  end
end
