unit RelFamilias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelFamilia = class(TForm)
    rptFamilias: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndFamilias: TQRBand;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    bndColunas: TQRBand;
    lblCodigoFamilia: TQRLabel;
    lblDescricaoFamilia: TQRLabel;
    fldCodigoFamilia: TQRDBText;
    fldDescricaoFamilia: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFamilia: TformRelFamilia;

implementation

uses ModuloDados;

{$R *.DFM}

end.
