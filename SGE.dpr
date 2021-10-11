program SGE;

uses
  Forms,
  MenuPrincipal in 'MenuPrincipal.pas' {formMenuPrincipal},
  ModuloDados in 'ModuloDados.pas' {dmBaseDados: TDataModule},
  FamiliaCategoria in 'FamiliaCategoria.pas' {formFamiliaCategoria},
  RotinasGerais in 'RotinasGerais.pas',
  SeekCategoria in 'SeekCategoria.pas' {formSeekCategoria},
  SeekCliente in 'SeekCliente.pas' {formSeekCliente},
  Marcas in 'Marcas.pas' {formMarcas},
  SeekMarca in 'SeekMarca.pas' {formSeekMarca},
  Produtos in 'Produtos.pas' {formProdutos},
  SeekProduto in 'SeekProduto.pas' {formSeekProduto},
  Fornecedores in 'Fornecedores.pas' {formFornecedores},
  SeekFornecedor in 'SeekFornecedor.pas' {formSeekFornecedor},
  Clientes in 'Clientes.pas' {formClientes},
  SeekFamilia in 'SeekFamilia.pas' {formSeekFamilia},
  Funcionarios in 'Funcionarios.pas' {formFuncionarios},
  SeekFuncionario in 'SeekFuncionario.pas' {formSeekFuncionario},
  EntraCompras in 'EntraCompras.pas' {formEntradaCompra},
  ProcessaNota in 'ProcessaNota.pas' {formProcessaNota},
  Devolucao in 'Devolucao.pas' {formDevolucao},
  Vendas in 'Vendas.pas' {formVendasBalcao},
  ListaProdutos in 'ListaProdutos.pas' {formListaProdutos},
  Perdas in 'Perdas.pas' {formPerdas},
  RelFamilias in 'RelFamilias.pas' {formRelFamilia},
  RelCategorias in 'RelCategorias.pas' {formRelCategoria},
  RelGrupoFamilia in 'RelGrupoFamilia.pas' {formRelGrupoFamilia},
  RelMarcas in 'RelMarcas.pas' {formRelMarca},
  RelFornecedores in 'RelFornecedores.pas' {formRelFornecedor},
  RelProdutos in 'RelProdutos.pas' {formRelProduto},
  RelFuncionarios in 'RelFuncionarios.pas' {formRelFuncionario},
  RelClientes in 'RelClientes.pas' {formRelCliente},
  Necessidades in 'Necessidades.pas' {formNecessidade},
  RelNecessidade in 'RelNecessidade.pas' {formRelNecessidade},
  TipoRelNecessita in 'TipoRelNecessita.pas' {formTipoRelCompra},
  OrdemCompra in 'OrdemCompra.pas' {formOrdemCompra},
  NumeroOC in 'NumeroOC.pas' {formNumeroOC},
  DataOC in 'DataOC.pas' {formDataOC},
  RelOrdemCompra in 'RelOrdemCompra.pas' {formRelOC},
  LogMensal in 'LogMensal.pas' {formLogMensal},
  RelLogMensal in 'RelLogMensal.pas' {formRelLogMensal},
  EditaEstados in 'EditaEstados.pas' {formEditaEstado},
  RelVendas in 'RelVendas.pas' {formRelVendas};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Gestão de Estoque';
  Application.CreateForm(TformMenuPrincipal, formMenuPrincipal);
  Application.CreateForm(TdmBaseDados, dmBaseDados);
  Application.CreateForm(TformFamiliaCategoria, formFamiliaCategoria);
  Application.CreateForm(TformSeekCategoria, formSeekCategoria);
  Application.CreateForm(TformSeekCliente, formSeekCliente);
  Application.CreateForm(TformMarcas, formMarcas);
  Application.CreateForm(TformSeekMarca, formSeekMarca);
  Application.CreateForm(TformProdutos, formProdutos);
  Application.CreateForm(TformSeekProduto, formSeekProduto);
  Application.CreateForm(TformFornecedores, formFornecedores);
  Application.CreateForm(TformSeekFornecedor, formSeekFornecedor);
  Application.CreateForm(TformClientes, formClientes);
  Application.CreateForm(TformSeekFamilia, formSeekFamilia);
  Application.CreateForm(TformFuncionarios, formFuncionarios);
  Application.CreateForm(TformSeekFuncionario, formSeekFuncionario);
  Application.CreateForm(TformEntradaCompra, formEntradaCompra);
  Application.CreateForm(TformProcessaNota, formProcessaNota);
  Application.CreateForm(TformDevolucao, formDevolucao);
  Application.CreateForm(TformVendasBalcao, formVendasBalcao);
  Application.CreateForm(TformListaProdutos, formListaProdutos);
  Application.CreateForm(TformPerdas, formPerdas);
  Application.CreateForm(TformRelFamilia, formRelFamilia);
  Application.CreateForm(TformRelCategoria, formRelCategoria);
  Application.CreateForm(TformRelGrupoFamilia, formRelGrupoFamilia);
  Application.CreateForm(TformRelMarca, formRelMarca);
  Application.CreateForm(TformRelFornecedor, formRelFornecedor);
  Application.CreateForm(TformRelProduto, formRelProduto);
  Application.CreateForm(TformRelFuncionario, formRelFuncionario);
  Application.CreateForm(TformRelCliente, formRelCliente);
  Application.CreateForm(TformNecessidade, formNecessidade);
  Application.CreateForm(TformRelNecessidade, formRelNecessidade);
  Application.CreateForm(TformTipoRelCompra, formTipoRelCompra);
  Application.CreateForm(TformOrdemCompra, formOrdemCompra);
  Application.CreateForm(TformNumeroOC, formNumeroOC);
  Application.CreateForm(TformDataOC, formDataOC);
  Application.CreateForm(TformRelOC, formRelOC);
  Application.CreateForm(TformLogMensal, formLogMensal);
  Application.CreateForm(TformRelLogMensal, formRelLogMensal);
  Application.CreateForm(TformEditaEstado, formEditaEstado);
  Application.CreateForm(TformRelVendas, formRelVendas);
  Application.Run;
end.
