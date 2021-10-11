object formProcessaNota: TformProcessaNota
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Processamento de Nota Fiscal'
  ClientHeight = 111
  ClientWidth = 291
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
  object lblMensagem: TLabel
    Left = 8
    Top = 8
    Width = 278
    Height = 20
    Caption = 'Confirma a gravação dos dados ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btnSim: TBitBtn
    Left = 48
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Sim'
    TabOrder = 0
    OnClick = btnSimClick
    Kind = bkYes
  end
  object btnNao: TBitBtn
    Left = 152
    Top = 40
    Width = 75
    Height = 25
    Caption = '&Não'
    TabOrder = 1
    Kind = bkNo
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 80
    Width = 273
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
  end
end
