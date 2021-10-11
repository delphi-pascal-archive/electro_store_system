unit Perdas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, DB;

type
  TformPerdas = class(TForm)
    lblRequisicao: TLabel;
    fldRequisicao: TDBText;
    fldDataEmissao: TDBText;
    lblDataEmissao: TLabel;
    lblCodigoProduto: TLabel;
    lblValorUnitario: TLabel;
    fldValorUnitario: TDBText;
    lblQuantidade: TLabel;
    lblValorTotal: TLabel;
    fldValorTotal: TDBText;
    btnProdutos: TSpeedButton;
    fldCodigoProduto: TDBEdit;
    fldQuantidade: TDBEdit;
    btnNovo: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnRetornar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure fldCodigoProdutoExit(Sender: TObject);
    procedure fldQuantidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPerdas: TformPerdas;

implementation

uses ModuloDados, ListaProdutos, RotinasGerais;

{$R *.DFM}

procedure TformPerdas.FormShow(Sender: TObject);
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
     dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'P';
     dmBaseDados.tblSaida.Post;
end;

procedure TformPerdas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmBaseDados.tblSaida.Close;
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblRequisicoes.Close;
end;

procedure TformPerdas.btnProdutosClick(Sender: TObject);
begin
     formListaProdutos.ShowModal;
     fldQuantidade.SetFocus;
end;

procedure TformPerdas.btnNovoClick(Sender: TObject);
begin
     dmBaseDados.tblSaida.Append;
     dmBaseDados.tblSaidaNumeroRequisicao.AsString := dmBaseDados.tblRequisicoesNumeroRequisicao.AsString;
     dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
     dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'P';
     dmBaseDados.tblSaida.Post;
     fldCodigoProduto.SetFocus;
end;

procedure TformPerdas.btnCancelarClick(Sender: TObject);
begin
     dmBaseDados.tblRequisicoes.Edit;
     dmBaseDados.tblRequisicoesSituacao.AsString := 'C';
     dmBaseDados.tblRequisicoes.Post;
     Close;
end;

procedure TformPerdas.btnRetornarClick(Sender: TObject);
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

procedure TformPerdas.fldCodigoProdutoExit(Sender: TObject);
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

procedure TformPerdas.fldQuantidadeExit(Sender: TObject);
begin
     dmBaseDados.tblSaida.Edit;
     dmBaseDados.tblSaidaValorTotal.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsInteger;
     dmBaseDados.tblSaida.Post;
end;

end.
