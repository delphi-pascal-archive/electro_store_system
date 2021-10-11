unit LogMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls;

type
  TformLogMensal = class(TForm)
    lblMesAno: TLabel;
    mskMesAno: TMaskEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogMensal: TformLogMensal;

implementation

uses RelLogMensal, ModuloDados;

{$R *.DFM}

procedure TformLogMensal.FormShow(Sender: TObject);
begin
     mskMesAno.Text := '';
     mskMesAno.SetFocus;
     pgrProcessamento.Position := 0;
end;

procedure TformLogMensal.btnOKClick(Sender: TObject);
var
   strFamilia,strCategoria,strProduto,strDescricao,strUnidade,strDocumento: string;
begin
     dmBaseDados.tblLogMensal.EmptyTable;
     dmBaseDados.tblLogMensal.Open;
     dmBaseDados.tblHistorico.Open;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblHistorico.Filter   := 'MesAno = '+#39+mskMesAno.Text+#39;
     dmBaseDados.tblHistorico.Filtered := True;
     pgrProcessamento.Max := dmBaseDados.tblHistorico.RecordCount;
     while (not dmBaseDados.tblHistorico.Eof) do
     begin
          strFamilia   := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3);
          strCategoria := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,4,3);
          strProduto   := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,7,6);
          dmBaseDados.tblProdutos.FindKey([strFamilia,strCategoria,strProduto]);
          strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
          strUnidade   := dmBaseDados.tblProdutosUnidadeMedida.AsString;
          strDocumento := '';
          if (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'E') then
             strDocumento := dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString
             else if (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'D') then
                     strDocumento := dmBaseDados.tblHistoricoControleDevolucao.AsString
             else if ((dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'V') or (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'P')) then
                     strDocumento := dmBaseDados.tblHistoricoNumeroRequisicao.AsString;
          dmBaseDados.tblLogMensal.Append;
          dmBaseDados.tblLogMensalDataLancamento.AsDateTime := dmBaseDados.tblHistoricoDataLancamento.AsDateTime;
          dmBaseDados.tblLogMensalCodigoMovimento.AsString  := dmBaseDados.tblHistoricoCodigoMovimento.AsString;
          dmBaseDados.tblLogMensalCodigoProduto.AsString    := dmBaseDados.tblHistoricoCodigoProduto.AsString;
          dmBaseDados.tblLogMensalDescricao.AsString        := strDescricao;
          dmBaseDados.tblLogMensalUnidadeMedida.AsString    := strUnidade;
          dmBaseDados.tblLogMensalDocumento.AsString        := strDocumento;
          dmBaseDados.tblLogMensalQuantidade.AsInteger      := dmBaseDados.tblHistoricoQuantidade.AsInteger;
          dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dmBaseDados.tblHistoricoValorLancamento.AsFloat;
          dmBaseDados.tblLogMensal.Post;
          dmBaseDados.tblHistorico.Next;
          pgrProcessamento.Position := pgrProcessamento.Position + 1;
     end;
     dmBaseDados.tblHistorico.Filter   := '';
     dmBaseDados.tblHistorico.Filtered := False;
     dmBaseDados.tblHistorico.Close;
     dmBaseDados.tblProdutos.Close;
     formRelLogMensal.lblMesAno.Caption := mskMesAno.Text;
     formRelLogMensal.rptLogMensal.Preview;
     dmBaseDados.tblLogMensal.Close;
end;

end.
