object formEditaEstado: TformEditaEstado
  Left = 232
  Top = 87
  BorderStyle = bsDialog
  Caption = 'Edição da tabela de Estados'
  ClientHeight = 446
  ClientWidth = 353
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
  object memEstados: TMemo
    Left = 8
    Top = 8
    Width = 337
    Height = 401
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnOK: TBitBtn
    Left = 272
    Top = 416
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
end
