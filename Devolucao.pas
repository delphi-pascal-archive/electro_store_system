unit Devolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, DB;

type
  TformDevolucao = class(TForm)
    lblControleDevolucao: TLabel;
    fldControleDevolucao: TDBEdit;
    lblCodigoProduto: TLabel;
    fldCodigoProduto: TDBEdit;
    lblQuantidae: TLabel;
    fldQuantidade: TDBEdit;
    btnNovo: TSpeedButton;
    btnRetornar: TSpeedButton;
    lblDescricao: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fldCodigoProdutoExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDevolucao: TformDevolucao;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformDevolucao.FormShow(Sender: TObject);
begin
     lblDescricao.Caption := '';
     dmBaseDados.tblEntrada.EmptyTable;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblEntrada.Open;
     dmBaseDados.tblEntrada.Append;
     dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblEntradaCodigoMovimento.AsString := 'D';
     dmBaseDados.tblEntrada.Post;
end;

procedure TformDevolucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblEntrada.Close;
end;

procedure TformDevolucao.fldCodigoProdutoExit(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
begin
     strCodFamilia   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,1,3);
     strCodCategoria := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,4,3);
     strCodProduto   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,7,6);
     if (not dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
     begin
          Mensagem('Código do produto não encontrado !');
          fldCodigoProduto.SetFocus;
     end
     else
         lblDescricao.Caption := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
end;

procedure TformDevolucao.btnNovoClick(Sender: TObject);
begin
     dmBaseDados.tblEntrada.Append;
     dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblEntradaCodigoMovimento.AsString := 'D';
     dmBaseDados.tblEntrada.Post;
     fldControleDevolucao.SetFocus;
end;

procedure TformDevolucao.btnRetornarClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strMes,strAno: string;
   intQuantidade,intTamanho: integer;
   wrdDia,wrdMes,wrdAno: word;
   fltValor: double;
begin
     if ((dmBaseDados.tblEntrada.State = dsInsert) or (dmBaseDados.tblEntrada.State = dsEdit)) then
        dmBaseDados.tblEntrada.Post;
     dmBaseDados.tblHistorico.Open;
     dmBaseDados.tblEntrada.First;
     while (not dmBaseDados.tblEntrada.Eof) do
     begin
          strCodFamilia   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,1,3);
          strCodCategoria := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,4,3);
          strCodProduto   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,7,6);
          intQuantidade   := dmBaseDados.tblEntradaQuantidade.AsInteger;
          DecodeDate(dmBaseDados.tblEntradaDataLancamento.AsDateTime,wrdAno,wrdMes,wrdDia);
          strMes     := IntToStr(wrdMes);
          intTamanho := Length(strMes);
          strMes     := Copy('00'+strMes,intTamanho+1,2);
          strAno     := IntToStr(wrdAno);
          intTamanho := Length(strAno);
          strAno     := Copy('0000'+strAno,intTamanho+1,4);
          dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
          dmBaseDados.tblProdutos.Edit;
          dmBaseDados.tblProdutosEstoqueAtual.AsInteger := dmBaseDados.tblProdutosEstoqueAtual.AsInteger + intQuantidade;
          dmBaseDados.tblProdutos.Post;
          fltValor := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
          dmBaseDados.tblHistorico.Append;
          dmBaseDados.tblHistoricoDataLancamento.AsDateTime  := dmBaseDados.tblEntradaDataLancamento.AsDateTime;
          dmBaseDados.tblHistoricoCodigoMovimento.AsString   := dmBaseDados.tblEntradaCodigoMovimento.AsString;
          dmBaseDados.tblHistoricoCodigoProduto.AsString     := dmBaseDados.tblEntradaCodigoProduto.AsString;
          dmBaseDados.tblHistoricoControleDevolucao.AsString := dmBaseDados.tblEntradaControleDevolucao.AsString;
          dmBaseDados.tblHistoricoQuantidade.AsInteger       := dmBaseDados.tblEntradaQuantidade.AsInteger;
          dmBaseDados.tblHistoricoValorLancamento.AsFloat    := fltValor * intQuantidade;
          dmBaseDados.tblHistoricoMesAno.AsString            := strMes+'/'+strAno;
          dmBaseDados.tblHistorico.Post;
          dmBaseDados.tblEntrada.Next;
     end;
     dmBaseDados.tblHistorico.Close;
     Close;
end;

end.
