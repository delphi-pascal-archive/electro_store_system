unit Vendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, DB;

type
  TformVendasBalcao = class(TForm)
    lblRequisicao: TLabel;
    fldRequisicao: TDBText;
    fldDataEmissao: TDBText;
    lblDataEmissao: TLabel;
    lblCodigoProduto: TLabel;
    fldCodigoProduto: TDBEdit;
    lblValorUnitario: TLabel;
    fldQuantidade: TDBEdit;
    fldValorUnitario: TDBText;
    lblQuantidade: TLabel;
    lblValorTotal: TLabel;
    fldValorTotal: TDBText;
    grdProdutos: TDBGrid;
    lblValorVenda: TLabel;
    lblValorTotalVenda: TLabel;
    btnNovo: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnRetornar: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnGravar: TSpeedButton;
    btnImprime: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fldCodigoProdutoExit(Sender: TObject);
    procedure fldQuantidadeExit(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formVendasBalcao: TformVendasBalcao;

implementation

uses ModuloDados, RotinasGerais, ListaProdutos, RelVendas;

{$R *.DFM}

procedure TformVendasBalcao.FormShow(Sender: TObject);
var
   wrdDia,wrdMes,wrdAno: word;
   intTamanho,intRequisicao: integer;
   strAno,strRequisicao: string;
begin
     dmBaseDados.tblSaida.EmptyTable;
     dmBaseDados.tblSaida.Open;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblRequisicoes.Open;
     DecodeDate(Date,wrdAno,wrdMes,wrdDia);
     intRequisicao := 0;
     strAno        := IntToStr(wrdAno);
     intTamanho    := Length(strAno);
     strAno        := Copy('00'+strAno,intTamanho+1,2);
     if (dmBaseDados.tblRequisicoes.RecordCount <> 0) then
     begin
          dmBaseDados.tblRequisicoes.Last;
          intRequisicao := StrToInt(Copy(dmBaseDados.tblRequisicoesNumeroRequisicao.AsString,1,6));
          if (strAno <> Copy(dmBaseDados.tblRequisicoesNumeroRequisicao.AsString,8,2)) then
             intRequisicao := 0;
     end;
     Inc(intRequisicao);
     strRequisicao := IntToStr(intRequisicao);
     intTamanho    := Length(strRequisicao);
     strRequisicao := Copy('000000'+strRequisicao,intTamanho+1,6);
     strRequisicao := strRequisicao+'/'+strAno;
     dmBaseDados.tblRequisicoes.Append;
     dmBaseDados.tblRequisicoesNumeroRequisicao.AsString := strRequisicao;
     dmBaseDados.tblRequisicoesDataEmissao.AsDateTime    := Date;
     dmBaseDados.tblRequisicoes.Post;
     dmBaseDados.tblSaida.Append;
     dmBaseDados.tblSaidaNumeroRequisicao.AsString := strRequisicao;
     dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
     dmBaseDados.tblSaida.Post;
     lblValorTotalVenda.Caption := '0';
end;

procedure TformVendasBalcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblSaida.Close;
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblRequisicoes.Close;
end;

procedure TformVendasBalcao.fldCodigoProdutoExit(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
begin
     strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
     strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
     strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
     if (dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
     begin
          dmBaseDados.tblSaida.Edit;
          dmBaseDados.tblSaidaValorUnitario.AsFloat := dmBaseDados.tblProdutosValorVenda.AsFloat;
          dmBaseDados.tblSaida.Post;
          fldQuantidade.SetFocus;
     end
     else
     begin
          Mensagem('Código do produto não encontrado !');
          fldCodigoProduto.SetFocus;
     end;
end;

procedure TformVendasBalcao.fldQuantidadeExit(Sender: TObject);
var
   fltValorTotal: double;
begin
     dmBaseDados.tblSaida.Edit;
     dmBaseDados.tblSaidaValorTotal.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsInteger;
     dmBaseDados.tblSaida.Post;
     dmBaseDados.tblSaida.DisableControls;
     dmBaseDados.tblSaida.First;
     fltValorTotal := 0;
     while (not dmBaseDados.tblSaida.Eof) do
     begin
          fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
          dmBaseDados.tblSaida.Next;
     end;
     dmBaseDados.tblSaida.EnableControls;
     lblValorTotalVenda.Caption := FloatToStr(fltValorTotal);
end;

procedure TformVendasBalcao.btnProdutosClick(Sender: TObject);
begin
     formListaProdutos.ShowModal;
     fldQuantidade.SetFocus;
end;

procedure TformVendasBalcao.btnNovoClick(Sender: TObject);
begin
     dmBaseDados.tblSaida.Append;
     dmBaseDados.tblSaidaNumeroRequisicao.AsString := dmBaseDados.tblRequisicoesNumeroRequisicao.AsString;
     dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
     dmBaseDados.tblSaida.Post;
     fldCodigoProduto.SetFocus;
end;

procedure TformVendasBalcao.btnExcluirClick(Sender: TObject);
var
   fltValor: double;
begin
     fltValor := 0;
     dmBaseDados.tblSaida.Delete;
     dmBaseDados.tblSaida.DisableControls;
     dmBaseDados.tblSaida.First;
     while (not dmBaseDados.tblSaida.Eof) do
     begin
          fltValor := fltValor + dmBaseDados.tblSaidaValorTotal.AsFloat;
          dmBaseDados.tblSaida.Next;
     end;
     dmBaseDados.tblSaida.EnableControls;
     lblValorTotalVenda.Caption := FloatToStr(fltValor);
end;

procedure TformVendasBalcao.btnCancelarClick(Sender: TObject);
begin
     dmBaseDados.tblRequisicoes.Edit;
     dmBaseDados.tblRequisicoesSituacao.AsString := 'C';
     dmBaseDados.tblRequisicoes.Post;
     Close;
end;

procedure TformVendasBalcao.btnRetornarClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strMes,strAno: string;
   intQuantidade,intTamanho: integer;
   wrdDia,wrdMes,wrdAno: word;
   fltValor: double;
begin
     if ((dmBaseDados.tblSaida.State = dsInsert) or (dmBaseDados.tblSaida.State = dsEdit)) then
        dmBaseDados.tblSaida.Post;
     dmBaseDados.tblHistorico.Open;
     dmBaseDados.tblSaida.First;
     while (not dmBaseDados.tblSaida.Eof) do
     begin
          strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
          strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
          strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
          intQuantidade   := dmBaseDados.tblSaidaQuantidade.AsInteger;
          DecodeDate(dmBaseDados.tblSaidaDataLancamento.AsDateTime,wrdAno,wrdMes,wrdDia);
          strMes     := IntToStr(wrdMes);
          intTamanho := Length(strMes);
          strMes     := Copy('00'+strMes,intTamanho+1,2);
          strAno     := IntToStr(wrdAno);
          intTamanho := Length(strAno);
          strAno     := Copy('0000'+strAno,intTamanho+1,4);
          dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
          dmBaseDados.tblProdutos.Edit;
          dmBaseDados.tblProdutosEstoqueAtual.AsInteger := dmBaseDados.tblProdutosEstoqueAtual.AsInteger - intQuantidade;
          dmBaseDados.tblProdutos.Post;
          fltValor := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
          dmBaseDados.tblHistorico.Append;
          dmBaseDados.tblHistoricoDataLancamento.AsDateTime := dmBaseDados.tblSaidaDataLancamento.AsDateTime;
          dmBaseDados.tblHistoricoCodigoMovimento.AsString  := dmBaseDados.tblSaidaCodigoMovimento.AsString;
          dmBaseDados.tblHistoricoCodigoProduto.AsString    := dmBaseDados.tblSaidaCodigoProduto.AsString;
          dmBaseDados.tblHistoricoNumeroRequisicao.AsString := dmBaseDados.tblSaidaNumeroRequisicao.AsString;
          dmBaseDados.tblHistoricoQuantidade.AsInteger      := dmBaseDados.tblSaidaQuantidade.AsInteger;
          dmBaseDados.tblHistoricoValorLancamento.AsFloat   := fltValor * intQuantidade;
          dmBaseDados.tblHistoricoMesAno.AsString           := strMes+'/'+strAno;
          dmBaseDados.tblHistorico.Post;
          dmBaseDados.tblSaida.Next;
     end;
     dmBaseDados.tblHistorico.Close;
     Close;
end;

procedure TformVendasBalcao.btnGravarClick(Sender: TObject);
var
   fltValorTotal: double;
begin
     if ((dmBaseDados.tblSaida.State = dsInsert) or (dmBaseDados.tblSaida.State = dsEdit)) then
     begin
          dmBaseDados.tblSaidaValorTotal.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsInteger;
          dmBaseDados.tblSaida.Post;
          fltValorTotal := StrToFloat(lblValorTotalVenda.Caption);
          fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
          lblValorTotalVenda.Caption := FloatToStr(fltValorTotal);
     end;
     fldCodigoProduto.SetFocus;
end;

procedure TformVendasBalcao.btnImprimeClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strDescricao,strUnidade: string;
begin
     dmBaseDados.tblRelVendas.EmptyTable;
     dmBaseDados.tblRelVendas.Open;
     dmBaseDados.tblSaida.DisableControls;
     dmBaseDados.tblSaida.First;
     while (not dmBaseDados.tblSaida.Eof) do
     begin
          strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
          strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
          strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
          dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
          strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
          strUnidade   := dmBaseDados.tblProdutosUnidadeMedida.AsString;
          dmBaseDados.tblRelVendas.Append;
          dmBaseDados.tblRelVendasCodigoProduto.AsString := dmBaseDados.tblSaidaCodigoProduto.AsString;
          dmBaseDados.tblRelVendasDescricao.AsString     := strDescricao;
          dmBaseDados.tblRelVendasUnidade.AsString       := strUnidade;
          dmBaseDados.tblRelVendasQuantidade.AsInteger   := dmBaseDados.tblSaidaQuantidade.AsInteger;
          dmBaseDados.tblRelVendasValorUnitario.AsFloat  := dmBaseDados.tblSaidaValorUnitario.AsFloat;
          dmBaseDados.tblRelVendasValorTotal.AsFloat     := dmBaseDados.tblSaidaValorTotal.AsFloat;
          dmBaseDados.tblRelVendas.Post;
          dmBaseDados.tblSaida.Next;
     end;
     dmBaseDados.tblSaida.EnableControls;
     formRelVendas.rptVendas.Preview;
     dmBaseDados.tblRelVendas.Close;
end;

end.
