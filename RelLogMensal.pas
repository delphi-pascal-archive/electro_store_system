unit RelLogMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelLogMensal = class(TForm)
    rptLogMensal: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    bndLogMensal: TQRBand;
    lblMesAno: TQRLabel;
    fldData: TQRDBText;
    lblData: TQRLabel;
    fldCodigoMovimento: TQRDBText;
    lblMovimento: TQRLabel;
    fldCodigoProduto: TQRDBText;
    lblDocumento: TQRLabel;
    fldDocumento: TQRDBText;
    lblCodigoProduto: TQRLabel;
    lblDescricao: TQRLabel;
    fldDescricao: TQRDBText;
    fldQuantidade: TQRDBText;
    lblQuantidade: TQRLabel;
    fldValorTotal: TQRDBText;
    lblValorLancamento: TQRLabel;
    fldUnidade: TQRDBText;
    lblUnidade: TQRLabel;
    bndSumario: TQRBand;
    lblTotalItens: TQRLabel;
    exprTotalItens: TQRExpr;
    lblValorTotal: TQRLabel;
    exprValorTotal: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelLogMensal: TformRelLogMensal;

implementation

uses ModuloDados;

{$R *.DFM}

end.
