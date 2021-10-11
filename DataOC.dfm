object formDataOC: TformDataOC
  Left = 235
  Top = 198
  BorderStyle = bsDialog
  Caption = 'Impressão de Ordem de Compra'
  ClientHeight = 105
  ClientWidth = 282
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
    Width = 185
    Height = 13
    Caption = 'Data de emissão da Ordem de Compra:'
  end
  object mskData: TMaskEdit
    Left = 200
    Top = 8
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object btnOK: TBitBtn
    Left = 48
    Top = 40
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 152
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 80
    Width = 265
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 3
  end
end
