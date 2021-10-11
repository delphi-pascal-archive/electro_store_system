unit NumeroOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids, DB;

type
  TformNumeroOC = class(TForm)
    grdNumerosOC: TDBGrid;
    btnExcluir: TSpeedButton;
    btnOK: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNumeroOC: TformNumeroOC;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformNumeroOC.FormShow(Sender: TObject);
begin
     dmbaseDados.tblNumeroOC.EmptyTable;
     dmbaseDados.tblNumeroOC.Open;
end;

procedure TformNumeroOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmbaseDados.tblNumeroOC.Close;
end;

procedure TformNumeroOC.btnOKClick(Sender: TObject);
var
   strOrdemCompra,strCodigo,strFamilia,strCategoria,strProduto,strDescricao,strUnidade: string;
   intQuantidade: integer;
   fltValorUnit: double;
   datData: TDateTime;
begin
     if ((dmBaseDados.tblNumeroOC.State = dsInsert) or (dmBaseDados.tblNumeroOC.State = dsEdit)) then
        dmBaseDados.tblNumeroOC.Post;
     dmBaseDados.tblRelOC.EmptyTable;
     dmBaseDados.tblRelOC.Open;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblOrdemCompra.Open;
     dmBaseDados.tblProdutosComprados.Open;
     if (dmBaseDados.tblNumeroOC.RecordCount <> 0) then
     begin
          dmBaseDados.tblNumeroOC.First;
          while (not dmBaseDados.tblNumeroOC.Eof) do
          begin
               strOrdemCompra := dmBaseDados.tblNumeroOCOrdemCompra.AsString;
               if (dmBaseDados.tblOrdemCompra.FindKey([strOrdemCompra])) then
               begin
                    datData := dmBaseDados.tblOrdemCompraDataEmissao.AsDateTime;
                    while ((dmBaseDados.tblProdutosCompradosOrdemCompra.AsString = strOrdemCompra) and (not dmBaseDados.tblProdutosComprados.Eof)) do
                    begin
                         strCodigo    := dmBaseDados.tblProdutosCompradosCodigoProduto.AsString;
                         strFamilia   := Copy(strCodigo,1,3);
                         strCategoria := Copy(strCodigo,4,3);
                         strProduto   := Copy(strCodigo,7,6);
                         strDescricao := '';
                         strUnidade   := '';
                         intQuantidade := dmBaseDados.tblProdutosCompradosQuantidade.AsInteger;
                         fltValorUnit  := dmBaseDados.tblProdutosCompradosValorUnitario.AsFloat;
                         if (dmBaseDados.tblProdutos.FindKey([strFamilia,strCategoria,strProduto])) then
                         begin
                              strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
                              strUnidade   := dmBaseDados.tblProdutosUnidadeMedida.AsString;
                         end;
                         dmBaseDados.tblRelOC.Append;
                         dmBaseDados.tblRelOCOrdemCompra.AsString   := strOrdemCompra;
                         dmBaseDados.tblRelOCDataEmissao.AsDateTime := datData;
                         dmBaseDados.tblRelOCCodigoProduto.AsString := strCodigo;
                         dmBaseDados.tblRelOCDescricao.AsString     := strDescricao;
                         dmBaseDados.tblRelOCUnidadeMedida.AsString := strUnidade;
                         dmBaseDados.tblRelOCQuantidade.AsInteger   := intQuantidade;
                         dmBaseDados.tblRelOCValorUnitario.AsFloat  := fltValorUnit;
                         dmBaseDados.tblRelOCValorTotal.AsFloat     := intQuantidade * fltValorUnit;
                         dmBaseDados.tblRelOC.Post;
                         dmBaseDados.tblProdutosComprados.Next;
                  end;
               end;
               dmBaseDados.tblNumeroOC.Next;
          end;
     end;
     dmBaseDados.tblRelOC.Close;
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblOrdemCompra.Close;
     dmBaseDados.tblProdutosComprados.Close;
     Close;
end;

procedure TformNumeroOC.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblNumeroOC.Delete;
end;

end.
