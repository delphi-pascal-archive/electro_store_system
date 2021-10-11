object formTipoRelCompra: TformTipoRelCompra
  Left = 236
  Top = 214
  BorderStyle = bsDialog
  Caption = 'Relatório Necessidade'
  ClientHeight = 98
  ClientWidth = 201
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
  object btnCodigo: TRadioButton
    Left = 32
    Top = 8
    Width = 121
    Height = 17
    Caption = 'Ordem de código'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btnDescricao: TRadioButton
    Left = 32
    Top = 32
    Width = 137
    Height = 17
    Caption = 'Ordem de descrição'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 64
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOKClick
    Kind = bkOK
  end
end
