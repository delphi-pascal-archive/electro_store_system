object formLogMensal: TformLogMensal
  Left = 245
  Top = 202
  BorderStyle = bsDialog
  Caption = 'Log Mensal'
  ClientHeight = 115
  ClientWidth = 217
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMesAno: TLabel
    Left = 8
    Top = 16
    Width = 138
    Height = 13
    Caption = 'Informe o mês/ano desejado:'
  end
  object mskMesAno: TMaskEdit
    Left = 152
    Top = 16
    Width = 57
    Height = 21
    EditMask = '00/0000;1;_'
    MaxLength = 7
    TabOrder = 0
    Text = '  /    '
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 120
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 88
    Width = 201
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
end
