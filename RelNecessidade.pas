unit RelNecessidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelNecessidade = class(TForm)
    rptNecessidade: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    lblCodigoProduto: TQRLabel;
    lblDescricaoAbreviada: TQRLabel;
    lblUnidadeMedida: TQRLabel;
    lblReferenciaFabricante: TQRLabel;
    lblMinimo: TQRLabel;
    bndNcecessidade: TQRBand;
    fldCodigoProduto: TQRDBText;
    fldDescricaoAbreviada: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldReferenciaFabricante: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    lblMaximo: TQRLabel;
    lblReposicao: TQRLabel;
    lblEstoque: TQRLabel;
    lblNecessidade: TQRLabel;
    lblValorUnitario: TQRLabel;
    fldMinimo: TQRDBText;
    fldMaximo: TQRDBText;
    fldReposicao: TQRDBText;
    fldEstoque: TQRDBText;
    fldNecessidade: TQRDBText;
    fldValorUnitario: TQRDBText;
    lblOrdem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelNecessidade: TformRelNecessidade;

implementation

uses ModuloDados;

{$R *.DFM}

end.
