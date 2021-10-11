unit TipoRelNecessita;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformTipoRelCompra = class(TForm)
    btnCodigo: TRadioButton;
    btnDescricao: TRadioButton;
    btnOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formTipoRelCompra: TformTipoRelCompra;

implementation

uses RelNecessidade, ModuloDados;

{$R *.DFM}

procedure TformTipoRelCompra.FormShow(Sender: TObject);
begin
     btnCodigo.Checked := True;
end;

procedure TformTipoRelCompra.btnOKClick(Sender: TObject);
begin
     dmBaseDados.tblNecessidade.Open;
     if (btnCodigo.Checked) then
        formRelNecessidade.lblOrdem.Caption := 'ORDEM DE CÓDIGO'
        else
        begin
             dmBaseDados.tblNecessidade.IndexName := 'IndDescricao';
             formRelNecessidade.lblOrdem.Caption := 'ORDEM DE DESCRIÇÃO';
        end;
     formRelNecessidade.rptNecessidade.Preview;
     dmBaseDados.tblNecessidade.IndexName := '';
     dmBaseDados.tblNecessidade.Close;
end;

end.
