object formSeekFornecedor: TformSeekFornecedor
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Localização de fornecedor'
  ClientHeight = 114
  ClientWidth = 258
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
  object lblCodigoFornecedor: TLabel
    Left = 8
    Top = 8
    Width = 143
    Height = 13
    Caption = 'Digite o código do fornecedor:'
  end
  object lblNomeFantasia: TLabel
    Left = 8
    Top = 40
    Width = 95
    Height = 13
    Caption = 'Ou o nome fantasia:'
  end
  object mskCodigoFornecedor: TMaskEdit
    Left = 160
    Top = 8
    Width = 41
    Height = 21
    EditMask = '0000;1;_'
    MaxLength = 4
    TabOrder = 0
    Text = '    '
  end
  object mskNomeFantasia: TMaskEdit
    Left = 112
    Top = 40
    Width = 137
    Height = 21
    EditMask = '>cccccccccccccccccccc;1;_'
    MaxLength = 20
    TabOrder = 1
    Text = '                    '
  end
  object btnOK: TBitBtn
    Left = 48
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 136
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    Kind = bkCancel
  end
end
