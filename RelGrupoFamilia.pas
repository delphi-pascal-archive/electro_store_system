unit RelGrupoFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelGrupoFamilia = class(TForm)
    rptGrupoFamilia: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndFamilias: TQRBand;
    lblFamilia: TQRLabel;
    fldCodigoFamilia: TQRDBText;
    fldDescricaoFamilia: TQRDBText;
    bndCategorias: TQRSubDetail;
    fldDescricaoCategoria: TQRDBText;
    fldCodigoCategoria: TQRDBText;
    bndRodape: TQRBand;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelGrupoFamilia: TformRelGrupoFamilia;

implementation

uses ModuloDados;

{$R *.DFM}

end.
