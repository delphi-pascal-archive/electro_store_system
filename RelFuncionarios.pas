unit RelFuncionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelFuncionario = class(TForm)
    rptFuncionarios: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndColunas: TQRBand;
    lblCodigoFuncionario: TQRLabel;
    lblNomeFuncionario: TQRLabel;
    lblEndereco: TQRLabel;
    lblBairro: TQRLabel;
    lblCidade: TQRLabel;
    lblEstado: TQRLabel;
    lblTelefone: TQRLabel;
    bndFuncionarios: TQRBand;
    fldCodigoFuncionario: TQRDBText;
    fldNomeFuncionario: TQRDBText;
    fldEndereco: TQRDBText;
    fldNumero: TQRDBText;
    fldBairro: TQRDBText;
    fldCidade: TQRDBText;
    fldEstado: TQRDBText;
    fldTelefone: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFuncionario: TformRelFuncionario;

implementation

uses ModuloDados;

{$R *.DFM}

end.
