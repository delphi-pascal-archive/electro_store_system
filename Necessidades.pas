unit Necessidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TformNecessidade = class(TForm)
    lblMensagem1: TLabel;
    lblMensagem2: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNecessidade: TformNecessidade;

implementation

uses ModuloDados, TipoRelNecessita;

{$R *.DFM}

procedure TformNecessidade.btnOKClick(Sender: TObject);
var
   intCompra: integer;
begin
     dmBaseDados.tblNecessidade.EmptyTable;
     dmBaseDados.tblNecessidade.Open;
     dmBaseDados.tblProdutos.Open;
     pgrProcessamento.Max := dmBaseDados.tblProdutos.RecordCount;
     while (not dmBaseDados.tblProdutos.Eof) do
     begin
          intCompra := 0;
          if ((dmBaseDados.tblProdutosEstoqueAtual.AsInteger < dmBaseDados.tblProdutosEstoqueReposicao.AsInteger) and (dmBaseDados.tblProdutosEstoqueAtual.AsInteger < dmBaseDados.tblProdutosEstoqueMinimo.AsInteger)) then
             intCompra := dmBaseDados.tblProdutosEstoqueReposicao.AsInteger
             else if ((dmBaseDados.tblProdutosEstoqueAtual.AsInteger < dmBaseDados.tblProdutosEstoqueReposicao.AsInteger) and (dmBaseDados.tblProdutosEstoqueAtual.AsInteger > dmBaseDados.tblProdutosEstoqueMinimo.AsInteger)) then
                     intCompra := dmBaseDados.tblProdutosEstoqueMinimo.AsInteger;
          if (intCompra <> 0) then
          begin
               dmBaseDados.tblNecessidade.Append;
               dmBaseDados.tblNecessidadeCodigoProduto.AsString := dmBaseDados.tblProdutosCodigoFamilia.AsString+dmBaseDados.tblProdutosCodigoCategoria.AsString+dmBaseDados.tblProdutosCodigoProduto.AsString;
               dmBaseDados.tblNecessidadeDescricaoAbreviada.AsString := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
               dmBaseDados.tblNecessidadeUnidadeMedida.AsString      := dmBaseDados.tblProdutosUnidadeMedida.AsString;
               dmBaseDados.tblNecessidadeReferenciaFabricante.AsString := dmBaseDados.tblProdutosReferenciaFabricante.AsString;
               dmBaseDados.tblNecessidadeMinimo.AsInteger  := dmBaseDados.tblProdutosEstoqueMinimo.AsInteger;
               dmBaseDados.tblNecessidadeMaximo.AsInteger  := dmBaseDados.tblProdutosEstoqueMaximo.AsInteger;
               dmBaseDados.tblNecessidadeEstoque.AsInteger := dmBaseDados.tblProdutosEstoqueAtual.AsInteger;
               dmBaseDados.tblNecessidadeReposicao.AsInteger   := dmBaseDados.tblProdutosEstoqueReposicao.AsInteger;
               dmBaseDados.tblNecessidadeNecessidade.AsInteger := intCompra;
               dmBaseDados.tblNecessidadeValorUnitario.AsFloat := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
               dmBaseDados.tblNecessidade.Post;
          end;
          dmBaseDados.tblProdutos.Next;
          pgrProcessamento.Position := pgrProcessamento.Position + 1;
     end;
     dmBaseDados.tblNecessidade.Close;
     dmBaseDados.tblProdutos.Close;
     formTipoRelCompra.ShowModal;
end;

procedure TformNecessidade.FormShow(Sender: TObject);
begin
     pgrProcessamento.Position := 0;
end;

end.
