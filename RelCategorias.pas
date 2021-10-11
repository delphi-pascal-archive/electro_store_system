unit RelCategorias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelCategoria = class(TForm)
    rptCategorias: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    bndCategorias: TQRBand;
    fldCodigoFamilia: TQRDBText;
    fldDescricaoFamilia: TQRDBText;
    bndRodape: TQRBand;
    lblMensagem: TQRLabel;
    bndColunas: TQRBand;
    lblCodigoFamilia: TQRLabel;
    lblDescricaoFamilia: TQRLabel;
    lblCodigoCategoria: TQRLabel;
    fldCodigoCategoria: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelCategoria: TformRelCategoria;

implementation

uses ModuloDados;

{$R *.DFM}

end.
