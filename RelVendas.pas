unit RelVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelVendas = class(TForm)
    rptVendas: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    lblCodigoProduto: TQRLabel;
    lblDescricaoAbreviada: TQRLabel;
    lblUnidadeMedida: TQRLabel;
    bndProdutos: TQRBand;
    fldCodigoProduto: TQRDBText;
    fldDescricaoAbreviada: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldQuantidade: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    lblQuantidade: TQRLabel;
    fldVlUnitario: TQRDBText;
    lblVlUnitario: TQRLabel;
    fldVlTotal: TQRDBText;
    lblVlTotal: TQRLabel;
    bndSumario: TQRBand;
    lbTotalVenda: TQRLabel;
    expTotalVenda: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelVendas: TformRelVendas;

implementation

uses ModuloDados;

{$R *.DFM}

end.
