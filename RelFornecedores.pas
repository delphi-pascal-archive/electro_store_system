unit RelFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelFornecedor = class(TForm)
    rptFornecedores: TQuickRep;
    bndCabecalho: TQRBand;
    bndColunas: TQRBand;
    bndFornecedores: TQRBand;
    bndRodape: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    fldCodigoFornecedor: TQRDBText;
    fldRazaoSocial: TQRDBText;
    fldCGC: TQRDBText;
    fldNomeFantasia: TQRDBText;
    fldTipoFornecedor: TQRDBText;
    fldEndereco: TQRDBText;
    fldNumero: TQRDBText;
    fldBairro: TQRDBText;
    fldCidade: TQRDBText;
    fldEstado: TQRDBText;
    lblCodigoFornecedor: TQRLabel;
    lblRazaoSocial: TQRLabel;
    lblCGC: TQRLabel;
    lblNomeFantasia: TQRLabel;
    lblTipoFornecedor: TQRLabel;
    lblEndereco: TQRLabel;
    lblBairro: TQRLabel;
    lblCidade: TQRLabel;
    lblEstado: TQRLabel;
    fldTelefone: TQRDBText;
    lblTelefone: TQRLabel;
    fldFax: TQRDBText;
    lblFax: TQRLabel;
    fldRepresentante: TQRDBText;
    lblRepresentante: TQRLabel;
    fldRamal: TQRDBText;
    lblRamal: TQRLabel;
    fldHomePage: TQRDBText;
    lblHomePage: TQRLabel;
    fldEMail: TQRDBText;
    lblEMail: TQRLabel;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFornecedor: TformRelFornecedor;

implementation

uses ModuloDados;

{$R *.DFM}

end.
