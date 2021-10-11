unit RelClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelCliente = class(TForm)
    rptClientes: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    lblNomeCliente: TQRLabel;
    lblNumeroRG: TQRLabel;
    lblNumeroCIC: TQRLabel;
    lblEndereco: TQRLabel;
    lblBairro: TQRLabel;
    lblCidade: TQRLabel;
    lblEstado: TQRLabel;
    lblTelefone: TQRLabel;
    lblFax: TQRLabel;
    bndClientes: TQRBand;
    fldNomeCliente: TQRDBText;
    fldNumeroRG: TQRDBText;
    fldNomeFantasia: TQRDBText;
    fldEndereco: TQRDBText;
    fldNumero: TQRDBText;
    fldBairro: TQRDBText;
    fldCidade: TQRDBText;
    fldEstado: TQRDBText;
    fldTelefone: TQRDBText;
    fldFax: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelCliente: TformRelCliente;

implementation

uses ModuloDados;

{$R *.DFM}

end.
