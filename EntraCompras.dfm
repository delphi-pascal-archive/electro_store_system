object formEntradaCompra: TformEntradaCompra
  Left = 78
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Entrada de produtos em estoque - Compras'
  ClientHeight = 322
  ClientWidth = 617
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
  object lblNotaFiscal: TLabel
    Left = 8
    Top = 8
    Width = 96
    Height = 13
    Caption = 'Número Nota Fiscal:'
  end
  object lblSerie: TLabel
    Left = 184
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Série:'
  end
  object lblFornecedor: TLabel
    Left = 280
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
  end
  object lblDataEmissao: TLabel
    Left = 8
    Top = 40
    Width = 82
    Height = 13
    Caption = 'Data de emissão:'
  end
  object lblValorTotal: TLabel
    Left = 192
    Top = 40
    Width = 50
    Height = 13
    Caption = 'Valor total:'
  end
  object btnExcluirProduto: TSpeedButton
    Left = 8
    Top = 272
    Width = 81
    Height = 41
    Hint = '|Exclui o produto selecionado.'
    Caption = 'Excluir Produto'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
      03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
      33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
      0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
      3333333337FFF7F3333333333000003333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnExcluirProdutoClick
  end
  object btnCancelarNota: TSpeedButton
    Left = 88
    Top = 272
    Width = 81
    Height = 41
    Hint = '|Cancela a operação de entrada da Nota Fiscal.'
    Caption = 'Cancelar Nota'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCancelarNotaClick
  end
  object btnGravarNota: TSpeedButton
    Left = 168
    Top = 272
    Width = 81
    Height = 41
    Hint = '|Grava a operação de entrada da Nota Fiscal e atualiza estoque.'
    Caption = 'Gravar Nota'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnGravarNotaClick
  end
  object fldSerie: TDBEdit
    Left = 216
    Top = 8
    Width = 41
    Height = 21
    DataField = 'Serie'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 1
  end
  object fldFornecedor: TDBLookupComboBox
    Left = 344
    Top = 8
    Width = 265
    Height = 21
    DataField = 'CodigoFornecedor'
    DataSource = dmBaseDados.dsNotaFiscal
    KeyField = 'CodigoFornecedor'
    ListField = 'NomeFantasia'
    ListSource = dmBaseDados.dsFornecedores
    TabOrder = 2
  end
  object fldDataEmissao: TDBEdit
    Left = 96
    Top = 40
    Width = 73
    Height = 21
    DataField = 'DataEmissao'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 3
  end
  object fldValorTotal: TDBEdit
    Left = 248
    Top = 40
    Width = 81
    Height = 21
    DataField = 'ValorTotal'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 4
    OnExit = fldValorTotalExit
  end
  object grdProdutos: TDBGrid
    Left = 8
    Top = 72
    Width = 473
    Height = 185
    DataSource = dmBaseDados.dsEntrada
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = grdProdutosColEnter
    OnColExit = grdProdutosColExit
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AliquotaICMS'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AliquotaIPI'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        ReadOnly = True
        Width = 73
        Visible = True
      end>
  end
  object fldNotaFiscal: TDBEdit
    Left = 112
    Top = 8
    Width = 57
    Height = 21
    DataField = 'NumeroNotaFiscal'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 0
  end
end
