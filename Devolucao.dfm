object formDevolucao: TformDevolucao
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Entrada de produtos por devolução'
  ClientHeight = 161
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblControleDevolucao: TLabel
    Left = 8
    Top = 8
    Width = 167
    Height = 13
    Caption = 'Número do Controle de Devolução:'
  end
  object lblCodigoProduto: TLabel
    Left = 280
    Top = 8
    Width = 90
    Height = 13
    Caption = 'Código do produto:'
  end
  object lblQuantidae: TLabel
    Left = 8
    Top = 72
    Width = 58
    Height = 13
    Caption = 'Quantidade:'
  end
  object btnNovo: TSpeedButton
    Left = 8
    Top = 112
    Width = 49
    Height = 41
    Hint = '|Adiciona um novo registro.'
    Caption = 'Novo'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333FF33333333FF333993333333300033377F3333333777333993333333
      300033F77FFF3333377739999993333333333777777F3333333F399999933333
      33003777777333333377333993333333330033377F3333333377333993333333
      3333333773333333333F333333333333330033333333F33333773333333C3333
      330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
      333333333337733333FF3333333C333330003333333733333777333333333333
      3000333333333333377733333333333333333333333333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnNovoClick
  end
  object btnRetornar: TSpeedButton
    Left = 56
    Top = 112
    Width = 49
    Height = 41
    Hint = '|Retorna ao menu principal.'
    Caption = 'Retornar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRetornarClick
  end
  object lblDescricao: TLabel
    Left = 8
    Top = 40
    Width = 58
    Height = 13
    Caption = 'lblDescricao'
  end
  object fldControleDevolucao: TDBEdit
    Left = 184
    Top = 8
    Width = 73
    Height = 21
    DataField = 'ControleDevolucao'
    DataSource = dmBaseDados.dsEntrada
    TabOrder = 0
  end
  object fldCodigoProduto: TDBEdit
    Left = 376
    Top = 8
    Width = 97
    Height = 21
    DataField = 'CodigoProduto'
    DataSource = dmBaseDados.dsEntrada
    TabOrder = 1
    OnExit = fldCodigoProdutoExit
  end
  object fldQuantidade: TDBEdit
    Left = 72
    Top = 72
    Width = 57
    Height = 21
    DataField = 'Quantidade'
    DataSource = dmBaseDados.dsEntrada
    TabOrder = 2
  end
end
