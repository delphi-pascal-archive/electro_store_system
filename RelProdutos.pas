unit RelProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelProduto = class(TForm)
    rptProdutos: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    lblCodigoProduto: TQRLabel;
    lblDescricaoAbreviada: TQRLabel;
    lblUnidadeMedida: TQRLabel;
    lblReferenciaFabricante: TQRLabel;
    lblDescricaoDetalhada: TQRLabel;
    lblMarca: TQRLabel;
    bndProdutos: TQRBand;
    fldCodigoFamilia: TQRDBText;
    fldCodigoCategoria: TQRDBText;
    fldCodigoProduto: TQRDBText;
    fldDescricaoAbreviada: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldDescricaoDetalhada: TQRDBText;
    fldMarca: TQRDBText;
    fldReferenciaFabricante: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelProduto: TformRelProduto;

implementation

uses ModuloDados;

{$R *.DFM}

end.
