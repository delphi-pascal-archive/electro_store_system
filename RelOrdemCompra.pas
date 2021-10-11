unit RelOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelOC = class(TForm)
    rptOrdemCompra: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    bndOrdemCompra: TQRBand;
    lblOrdemCompra: TQRLabel;
    fldOrdemCompra: TQRDBText;
    lblDataEmissao: TQRLabel;
    fldDataEmissao: TQRDBText;
    lblCodigoProduto: TQRLabel;
    bndProdutos: TQRSubDetail;
    fldCodigoProduto: TQRDBText;
    fldDescricao: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldQuantidade: TQRDBText;
    fldVlUnit: TQRDBText;
    fldVlTotal: TQRDBText;
    lblDescricao: TQRLabel;
    lblUnidade: TQRLabel;
    lblQuantidade: TQRLabel;
    lblValorUnitario: TQRLabel;
    lblValorTotal: TQRLabel;
    bndTotalOC: TQRBand;
    lblTotalOC: TQRLabel;
    expValorTotal: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelOC: TformRelOC;

implementation

uses ModuloDados;

{$R *.DFM}

end.
