unit RelMarcas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelMarca = class(TForm)
    rptMarcas: TQuickRep;
    bndCabecalho: TQRBand;
    bnd: TQRBand;
    bndMarcas: TQRBand;
    bndRodape: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblCodigoMarca: TQRLabel;
    QRLabel4: TQRLabel;
    fldCodigoMarca: TQRDBText;
    fldMarca: TQRDBText;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelMarca: TformRelMarca;

implementation

uses ModuloDados;

{$R *.DFM}

end.
