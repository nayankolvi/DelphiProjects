object Calculator: TCalculator
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
    Top = 128
    Width = 486
    Height = 230
    Color = 16382457
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitLeft = 64
    ExplicitTop = 128
    inherited ButtonOne: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonTwo: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonThree: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonPlus: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonFour: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonFive: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonSix: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonMinus: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonSeven: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonEight: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonNine: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonMul: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonClr: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonZero: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonEqu: TButton
      OnClick = OnButtonEvent
    end
    inherited ButtonDiv: TButton
      OnClick = OnButtonEvent
    end
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
    ExplicitLeft = 64
    ExplicitTop = 56
    ExplicitWidth = 486
    inherited DisplayTab: TEdit
      Left = 32
      Top = 16
      Width = 403
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 32
      ExplicitTop = 16
      ExplicitWidth = 403
    end
  end
end
