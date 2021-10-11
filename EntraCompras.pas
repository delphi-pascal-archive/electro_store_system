unit EntraCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, DB;

type
  TformEntradaCompra = class(TForm)
    lblNotaFiscal: TLabel;
    fldSerie: TDBEdit;
    lblSerie: TLabel;
    lblFornecedor: TLabel;
    fldFornecedor: TDBLookupComboBox;
    fldDataEmissao: TDBEdit;
    fldValorTotal: TDBEdit;
    lblDataEmissao: TLabel;
    lblValorTotal: TLabel;
    grdProdutos: TDBGrid;
    btnExcluirProduto: TSpeedButton;
    btnCancelarNota: TSpeedButton;
    btnGravarNota: TSpeedButton;
    fldNotaFiscal: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnCancelarNotaClick(Sender: TObject);
    procedure btnGravarNotaClick(Sender: TObject);
    procedure grdProdutosColExit(Sender: TObject);
    procedure grdProdutosColEnter(Sender: TObject);
    procedure fldValorTotalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEntradaCompra: TformEntradaCompra;

implementation

uses ModuloDados, ProcessaNota, RotinasGerais;

{$R *.DFM}

procedure TformEntradaCompra.FormShow(Sender: TObject);
begin
     dmBaseDados.tblEntrada.EmptyTable;
     dmBaseDados.tblNotaFiscal.Open;
     dmBaseDados.tblNotaFiscal.IndexName := 'IndNotaFiscal';
     dmBaseDados.tblEntrada.Open;
     dmBaseDados.tblFornecedores.Open;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblNotaFiscal.Append;
     grdProdutos.SelectedField := dmBaseDados.tblEntradaCodigoProduto;
     fldNotaFiscal.SetFocus;
end;

procedure TformEntradaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblNotaFiscal.IndexName := '';
     dmBaseDados.tblNotaFiscal.Close;
     dmBaseDados.tblEntrada.Close;
     dmBaseDados.tblFornecedores.Close;
     dmBaseDados.tblProdutos.Close;
end;

procedure TformEntradaCompra.btnExcluirProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblEntrada.Delete;
end;

procedure TformEntradaCompra.btnCancelarNotaClick(Sender: TObject);
begin
     dmBaseDados.tblNotaFiscal.BeforeDelete := nil;
     dmBaseDados.tblNotaFiscal.Delete;
     dmBaseDados.tblNotaFiscal.BeforeDelete := dmBaseDados.tblFamiliasBeforeDelete;
     Close;
end;

procedure TformEntradaCompra.btnGravarNotaClick(Sender: TObject);
begin
     if (formProcessaNota.ShowModal = mrYes) then
        Close;
end;

procedure TformEntradaCompra.grdProdutosColExit(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
begin
     if (grdProdutos.SelectedField = dmBaseDados.tblEntradaCodigoProduto) then
     begin
          strCodFamilia   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,1,3);
          strCodCategoria := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,4,3);
          strCodProduto   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,7,6);
          if (not dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
          begin
               Mensagem('Código do produto não encontrado !');
               dmBaseDados.tblEntrada.Edit;
               dmBaseDados.tblEntradaCodigoProduto.AsString := '';
               dmBaseDados.tblEntrada.Post;
          end;
     end;
     if (grdProdutos.SelectedField = dmBaseDados.tblEntradaValorUnitario) then
     begin
          if ((dmBaseDados.tblEntrada.State <> dsInsert) and (dmBaseDados.tblEntrada.State <> dsEdit)) then
             dmBaseDados.tblEntrada.Edit;
          dmBaseDados.tblEntradaValorTotal.AsFloat := dmBaseDados.tblEntradaQuantidade.AsInteger * dmBaseDados.tblEntradaValorUnitario.AsFloat;
          dmBaseDados.tblEntrada.Post;
     end;
end;

procedure TformEntradaCompra.grdProdutosColEnter(Sender: TObject);
begin
     if (grdProdutos.SelectedField = dmBaseDados.tblEntradaCodigoProduto) then
     begin
          if ((dmBaseDados.tblEntrada.State <> dsInsert) and (dmBaseDados.tblEntrada.State <> dsEdit)) then
             dmBaseDados.tblEntrada.Edit;
          dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
          dmBaseDados.tblEntradaCodigoMovimento.AsString  := 'E';
          dmBaseDados.tblEntrada.Post;
     end;
end;

procedure TformEntradaCompra.fldValorTotalExit(Sender: TObject);
begin
     if ((dmBaseDados.tblEntrada.State <> dsInsert) and (dmBaseDados.tblEntrada.State <> dsEdit)) then
        dmBaseDados.tblEntrada.Edit;
     dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblEntradaCodigoMovimento.AsString  := 'E';
     dmBaseDados.tblEntrada.Post;
end;

end.
