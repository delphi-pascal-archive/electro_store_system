unit ProcessaNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TformProcessaNota = class(TForm)
    lblMensagem: TLabel;
    btnSim: TBitBtn;
    btnNao: TBitBtn;
    pgrProcessamento: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formProcessaNota: TformProcessaNota;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformProcessaNota.FormShow(Sender: TObject);
begin
     pgrProcessamento.Position := 0;
end;

procedure TformProcessaNota.btnSimClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strMes,strAno: string;
   intQuantidade,intTamanho: integer;
   wrdDia,wrdMes,wrdAno: word;
begin
     pgrProcessamento.Max := dmBaseDados.tblEntrada.RecordCount;
     dmBaseDados.tblProdutos.Open;
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
          dmBaseDados.tblProdutosValorUnitarioAnterior.AsFloat := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
          dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat    := dmBaseDados.tblEntradaValorUnitario.AsFloat;
          dmBaseDados.tblProdutosDataUltimaCompra.AsDateTime   := dmBaseDados.tblEntradaDataLancamento.AsDateTime;
          dmBaseDados.tblProdutos.Post;
          dmBaseDados.tblHistorico.Append;
          dmBaseDados.tblHistoricoDataLancamento.AsDateTime := dmBaseDados.tblEntradaDataLancamento.AsDateTime;
          dmBaseDados.tblHistoricoCodigoMovimento.AsString  := dmBaseDados.tblEntradaCodigoMovimento.AsString;
          dmBaseDados.tblHistoricoCodigoProduto.AsString    := dmBaseDados.tblEntradaCodigoProduto.AsString;
          dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString := dmBaseDados.tblEntradaNumeroNotaFiscal.AsString;
          dmBaseDados.tblHistoricoQuantidade.AsInteger      := dmBaseDados.tblEntradaQuantidade.AsInteger;
          dmBaseDados.tblHistoricoValorLancamento.AsFloat   := dmBaseDados.tblEntradaValorTotal.AsFloat;
          dmBaseDados.tblHistoricoMesAno.AsString           := strMes+'/'+strAno;
          dmBaseDados.tblHistorico.Post;
          dmBaseDados.tblEntrada.Next;
          pgrProcessamento.Position := pgrProcessamento.Position + 1;
     end;
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblHistorico.Close;
end;

end.
