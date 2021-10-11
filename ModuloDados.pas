unit ModuloDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmBaseDados = class(TDataModule)
    tblFamilias: TTable;
    dsFamilias: TDataSource;
    tblFamiliasCodigoFamilia: TStringField;
    tblFamiliasDescricaoFamilia: TStringField;
    tblCategorias: TTable;
    dsCategorias: TDataSource;
    tblCategoriasCodigoFamilia: TStringField;
    tblCategoriasCodigoCategoria: TStringField;
    tblCategoriasDescricaoCategoria: TStringField;
    tblMarcas: TTable;
    dsMarcas: TDataSource;
    tblMarcasCodigoMarca: TStringField;
    tblMarcasMarca: TStringField;
    tblProdutos: TTable;
    dsProdutos: TDataSource;
    tblProdutosCodigoFamilia: TStringField;
    tblProdutosCodigoCategoria: TStringField;
    tblProdutosCodigoProduto: TStringField;
    tblProdutosReferenciaFabricante: TStringField;
    tblProdutosDescricaoAbreviada: TStringField;
    tblProdutosDescricaoDetalhada: TStringField;
    tblProdutosCaracteristicas: TMemoField;
    tblProdutosUnidadeMedida: TStringField;
    tblProdutosCodigoMarca: TStringField;
    tblProdutosValorUnitarioAtual: TFloatField;
    tblProdutosValorUnitarioAnterior: TFloatField;
    tblProdutosMargemLucro: TFloatField;
    tblProdutosValorVenda: TFloatField;
    tblProdutosEstoqueMinimo: TFloatField;
    tblProdutosEstoqueReposicao: TFloatField;
    tblProdutosEstoqueAtual: TFloatField;
    tblProdutosDataUltimaCompra: TDateField;
    tblProdutosLocalizacao: TStringField;
    tblProdutosImagem: TGraphicField;
    tblFornecedores: TTable;
    dsFornecedores: TDataSource;
    tblFuncionarios: TTable;
    dsFuncionarios: TDataSource;
    tblFuncionariosCodigoFuncionario: TStringField;
    tblFuncionariosNomeFuncionaro: TStringField;
    tblFuncionariosEnderecoResidencia: TStringField;
    tblFuncionariosNumero: TFloatField;
    tblFuncionariosBairro: TStringField;
    tblFuncionariosCidade: TStringField;
    tblFuncionariosEstado: TStringField;
    tblFuncionariosCEP: TStringField;
    tblFuncionariosTelefone: TStringField;
    tblClientes: TTable;
    dsClientes: TDataSource;
    tblClientesNumeroRG: TStringField;
    tblClientesNomeCliente: TStringField;
    tblClientesNumeroCIC: TStringField;
    tblClientesEnderecoResidencia: TStringField;
    tblClientesNumero: TFloatField;
    tblClientesBairro: TStringField;
    tblClientesCidade: TStringField;
    tblClientesEstado: TStringField;
    tblClientesCEP: TStringField;
    tblClientesTelefone: TStringField;
    tblClientesFax: TStringField;
    tblProdutosFornecidos: TTable;
    dsProdutosFornecidos: TDataSource;
    tblProdutosFornecidosCodigoFornecedor: TStringField;
    tblProdutosFornecidosCodigoFamilia: TStringField;
    tblProdutosFornecidosCodigoCategoria: TStringField;
    tblOrdemCompra: TTable;
    dsOrdemCompra: TDataSource;
    tblOrdemCompraOrdemCompra: TStringField;
    tblOrdemCompraDataEmissao: TDateField;
    tblOrdemCompraValorTotal: TFloatField;
    tblProdutosComprados: TTable;
    dsProdutosComprados: TDataSource;
    tblProdutosCompradosIDRegistro: TAutoIncField;
    tblProdutosCompradosOrdemCompra: TStringField;
    tblProdutosCompradosCodigoProduto: TStringField;
    tblProdutosCompradosQuantidade: TFloatField;
    tblProdutosCompradosValorUnitario: TFloatField;
    tblEntrada: TTable;
    dsEntrada: TDataSource;
    tblEntradaIDregistro: TAutoIncField;
    tblEntradaNumeroNotaFiscal: TStringField;
    tblEntradaDataLancamento: TDateField;
    tblEntradaCodigoMovimento: TStringField;
    tblEntradaControleDevolucao: TStringField;
    tblEntradaCodigoProduto: TStringField;
    tblEntradaQuantidade: TFloatField;
    tblEntradaValorUnitario: TFloatField;
    tblEntradaAliquotaICMS: TFloatField;
    tblEntradaAliquotaIPI: TFloatField;
    tblEntradaValorTotal: TFloatField;
    tblNotaFiscal: TTable;
    dsNotaFiscal: TDataSource;
    tblNotaFiscalIDRegistro: TAutoIncField;
    tblNotaFiscalNumeroNotaFiscal: TStringField;
    tblNotaFiscalSerie: TStringField;
    tblNotaFiscalCodigoFornecedor: TStringField;
    tblNotaFiscalDataEmissao: TDateField;
    tblNotaFiscalValorTotal: TFloatField;
    tblSaida: TTable;
    dsSaida: TDataSource;
    tblSaidaNumeroRequisicao: TStringField;
    tblSaidaDataLancamento: TDateField;
    tblSaidaCodigoMovimento: TStringField;
    tblSaidaCodigoProduto: TStringField;
    tblSaidaQuantidade: TFloatField;
    tblSaidaValorUnitario: TFloatField;
    tblSaidaValorTotal: TFloatField;
    tblHistorico: TTable;
    dsHistorico: TDataSource;
    tblHistoricoIDRegistro: TAutoIncField;
    tblHistoricoDataLancamento: TDateField;
    tblHistoricoCodigoMovimento: TStringField;
    tblHistoricoCodigoProduto: TStringField;
    tblHistoricoNumeroNotaFiscal: TStringField;
    tblHistoricoNumeroRequisicao: TStringField;
    tblHistoricoControleDevolucao: TStringField;
    tblHistoricoQuantidade: TFloatField;
    tblHistoricoValorLancamento: TFloatField;
    tblHistoricoMesAno: TStringField;
    tblFornecedoresCodigoFornecedor: TStringField;
    tblFornecedoresRazaoSocial: TStringField;
    tblFornecedoresCGC: TStringField;
    tblFornecedoresNomeFantasia: TStringField;
    tblFornecedoresTipoFornecedor: TStringField;
    tblFornecedoresEndereco: TStringField;
    tblFornecedoresNumero: TFloatField;
    tblFornecedoresBairro: TStringField;
    tblFornecedoresCidade: TStringField;
    tblFornecedoresEstado: TStringField;
    tblFornecedoresCEP: TStringField;
    tblFornecedoresTelefone: TStringField;
    tblFornecedoresFax: TStringField;
    tblFornecedoresRepresentante: TStringField;
    tblFornecedoresRamal: TStringField;
    tblFornecedoresHomePage: TStringField;
    tblFornecedoresEMail: TStringField;
    tblProdutosEstoqueMaximo: TFloatField;
    tblRequisicoes: TTable;
    dsRequisicoes: TDataSource;
    tblRequisicoesNumeroRequisicao: TStringField;
    tblRequisicoesDataEmissao: TDateField;
    tblRequisicoesSituacao: TStringField;
    tblNecessidade: TTable;
    dsNecessidade: TDataSource;
    tblNecessidadeCodigoProduto: TStringField;
    tblNecessidadeDescricaoAbreviada: TStringField;
    tblNecessidadeUnidadeMedida: TStringField;
    tblNecessidadeMinimo: TFloatField;
    tblNecessidadeMaximo: TFloatField;
    tblNecessidadeReposicao: TFloatField;
    tblNecessidadeEstoque: TFloatField;
    tblNecessidadeNecessidade: TFloatField;
    tblNecessidadeValorUnitario: TFloatField;
    tblNecessidadeReferenciaFabricante: TStringField;
    tblNumeroOC: TTable;
    dsNumeroOC: TDataSource;
    tblNumeroOCOrdemCompra: TStringField;
    tblRelOC: TTable;
    dsRelOC: TDataSource;
    tblRelOCIDRegistro: TAutoIncField;
    tblRelOCOrdemCompra: TStringField;
    tblRelOCCodigoProduto: TStringField;
    tblRelOCDescricao: TStringField;
    tblRelOCUnidadeMedida: TStringField;
    tblRelOCQuantidade: TFloatField;
    tblRelOCValorUnitario: TFloatField;
    tblRelOCValorTotal: TFloatField;
    tblRelOCDataEmissao: TDateField;
    tblLogMensal: TTable;
    dsLogMensal: TDataSource;
    tblLogMensalDataLancamento: TDateField;
    tblLogMensalCodigoMovimento: TStringField;
    tblLogMensalCodigoProduto: TStringField;
    tblLogMensalDescricao: TStringField;
    tblLogMensalUnidadeMedida: TStringField;
    tblLogMensalDocumento: TStringField;
    tblLogMensalQuantidade: TFloatField;
    tblLogMensalValorLancamento: TFloatField;
    tblRelVendas: TTable;
    dsRelVendas: TDataSource;
    tblRelVendasCodigoProduto: TStringField;
    tblRelVendasDescricao: TStringField;
    tblRelVendasUnidade: TStringField;
    tblRelVendasQuantidade: TFloatField;
    tblRelVendasValorUnitario: TFloatField;
    tblRelVendasValorTotal: TFloatField;
    procedure tblFamiliasBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBaseDados: TdmBaseDados;

implementation

uses RotinasGerais;

{$R *.DFM}

procedure TdmBaseDados.tblFamiliasBeforeDelete(DataSet: TDataSet);
var
   intConfirma: integer;
begin
     intConfirma := Excluir();
     if (intConfirma <> IDYES) then
        Abort;
end;

procedure TdmBaseDados.DataModuleCreate(Sender: TObject);
var
 dbp: string;
begin
 dbp:=ExtractFilePath(Application.ExeName)+'tables\';

 tblFamilias.DatabaseName:=dbp;
 tblCategorias.DatabaseName:=dbp;
 tblMarcas.DatabaseName:=dbp;
 tblProdutos.DatabaseName:=dbp;
 tblFornecedores.DatabaseName:=dbp;
 tblProdutosFornecidos.DatabaseName:=dbp;
 tblFuncionarios.DatabaseName:=dbp;
 tblClientes.DatabaseName:=dbp;
 tblOrdemCompra.DatabaseName:=dbp;
 tblProdutosComprados.DatabaseName:=dbp;
 tblNotaFiscal.DatabaseName:=dbp;
 tblEntrada.DatabaseName:=dbp;
 tblSaida.DatabaseName:=dbp;
 tblHistorico.DatabaseName:=dbp;
 tblRequisicoes.DatabaseName:=dbp;
 tblNecessidade.DatabaseName:=dbp;
 tblNumeroOC.DatabaseName:=dbp;
 tblRelOC.DatabaseName:=dbp;
 tblLogMensal.DatabaseName:=dbp;
 tblRelVendas.DatabaseName:=dbp;
end;

end.
