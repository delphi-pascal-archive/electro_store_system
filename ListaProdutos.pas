unit ListaProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Grids, DBGrids, DBCtrls;

type
  TformListaProdutos = class(TForm)
    grdProdutos: TDBGrid;
    lblCodigo: TLabel;
    btnOK: TSpeedButton;
    fldCodigoFamilia: TDBText;
    fldCodigoCategoria: TDBText;
    fldCodigoProduto: TDBText;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formListaProdutos: TformListaProdutos;

implementation

uses ModuloDados;

{$R *.DFM}

procedure TformListaProdutos.btnOKClick(Sender: TObject);
var
   strCodigo: string;
begin
     strCodigo := dmBaseDados.tblProdutosCodigoFamilia.AsString+dmBaseDados.tblProdutosCodigoCategoria.AsString+dmBaseDados.tblProdutosCodigoProduto.AsString;
     dmBaseDados.tblSaida.Edit;
     dmBaseDados.tblSaidaCodigoProduto.AsString := strCodigo;
     dmBaseDados.tblSaidaValorUnitario.AsFloat  := dmBaseDados.tblProdutosValorVenda.AsFloat;
     dmBaseDados.tblSaida.Post;
     dmBaseDados.tblProdutos.IndexName := '';
     Close;
end;

procedure TformListaProdutos.FormShow(Sender: TObject);
begin
     dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
end;

end.
