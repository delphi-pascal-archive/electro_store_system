object formSeekProduto: TformSeekProduto
  Left = 271
  Top = 166
  BorderStyle = bsDialog
  Caption = 'Localização de produto'
  ClientHeight = 73
  ClientWidth = 233
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
    Width = 128
    Height = 13
    Caption = 'Digite o código do produto:'
  end
  object mskCodigo: TMaskEdit
    Left = 144
    Top = 8
    Width = 81
    Height = 21
    EditMask = '0000000000-0;1;_'
    MaxLength = 12
    TabOrder = 0
    Text = '          - '
  end
  object btnOK: TBitBtn
    Left = 32
    Top = 40
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 128
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
end
