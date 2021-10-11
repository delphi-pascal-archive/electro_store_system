object formListaProdutos: TformListaProdutos
  Left = 201
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Lista de Produtos'
  ClientHeight = 378
  ClientWidth = 529
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
  object lblCodigo: TLabel
    Left = 8
    Top = 352
    Width = 44
    Height = 13
    Caption = 'Código:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TSpeedButton
    Left = 464
    Top = 352
    Width = 57
    Height = 22
    Caption = 'OK'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555555555555555555555555555555555555555FF55555555555559055555
      55555555577FF5555555555599905555555555557777F5555555555599905555
      555555557777FF5555555559999905555555555777777F555555559999990555
      5555557777777FF5555557990599905555555777757777F55555790555599055
      55557775555777FF5555555555599905555555555557777F5555555555559905
      555555555555777FF5555555555559905555555555555777FF55555555555579
      05555555555555777FF5555555555557905555555555555777FF555555555555
      5990555555555555577755555555555555555555555555555555}
    NumGlyphs = 2
    OnClick = btnOKClick
  end
  object fldCodigoFamilia: TDBText
    Left = 56
    Top = 352
    Width = 42
    Height = 13
    DataField = 'CodigoFamilia'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object fldCodigoCategoria: TDBText
    Left = 80
    Top = 352
    Width = 42
    Height = 13
    DataField = 'CodigoCategoria'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object fldCodigoProduto: TDBText
    Left = 104
    Top = 352
    Width = 42
    Height = 13
    DataField = 'CodigoProduto'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grdProdutos: TDBGrid
    Left = 8
    Top = 8
    Width = 513
    Height = 337
    DataSource = dmBaseDados.dsProdutos
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DescricaoAbreviada'
        Visible = True
      end>
  end
end
