unit MenuPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ExtCtrls, ImgList, ToolWin, JPEG;

type
  TformMenuPrincipal = class(TForm)
    mnuMenu: TMainMenu;
    mnuCadastro: TMenuItem;
    opcFamiliaCategoria: TMenuItem;
    mnuSair: TMenuItem;
    imgFundo: TImage;
    stsInforma: TStatusBar;
    lstImagens: TImageList;
    cbarFerramentas: TCoolBar;
    tbarBotoes: TToolBar;
    btnFamiliaCategoria: TToolButton;
    Separador1: TToolButton;
    btnSair: TToolButton;
    tmrRelogio: TTimer;
    opcMarcas: TMenuItem;
    btnMarcas: TToolButton;
    opcProdutos: TMenuItem;
    btnProdutos: TToolButton;
    opcFornecedores: TMenuItem;
    btnFornecedores: TToolButton;
    opcFuncionarios: TMenuItem;
    btnFuncionarios: TToolButton;
    opcClientes: TMenuItem;
    btnClientes: TToolButton;
    mnuEntradas: TMenuItem;
    opcNotaFiscal: TMenuItem;
    btnEntrada: TToolButton;
    ToolButton2: TToolButton;
    opcDevolucao: TMenuItem;
    btnDevolucao: TToolButton;
    mnuSaidas: TMenuItem;
    opcVendas: TMenuItem;
    btnVendas: TToolButton;
    ToolButton3: TToolButton;
    opcPerdas: TMenuItem;
    btnPerdas: TToolButton;
    mnuRelatorios: TMenuItem;
    opcRelFamilias: TMenuItem;
    opcRelFamiliaCodigo: TMenuItem;
    opcRelFamiliaAlfa: TMenuItem;
    opcRelCategorias: TMenuItem;
    opcRelCategoriaCodigo: TMenuItem;
    opcRelCategoriaAlfa: TMenuItem;
    opcRelGrupoFamilia: TMenuItem;
    opcRelMarcas: TMenuItem;
    opcRelMarcaCodigo: TMenuItem;
    opcRelMarcaAlfa: TMenuItem;
    opcRelFornecedores: TMenuItem;
    opcRelFornecedorCodigo: TMenuItem;
    opcRelFornecedorCGC: TMenuItem;
    opcRelFornecedorNome: TMenuItem;
    opcRelFornecedorTipo: TMenuItem;
    opcRelProdutos: TMenuItem;
    opcRelProdutoCodigo: TMenuItem;
    opcRelProdutoAlfa: TMenuItem;
    opcRelProdutoReferencia: TMenuItem;
    opcRelFuncionarios: TMenuItem;
    opcRelFuncionarioCodigo: TMenuItem;
    opcRelFuncionarioAlfa: TMenuItem;
    opcRelClientes: TMenuItem;
    opcRelClienteAlfa: TMenuItem;
    opcRelClienteRG: TMenuItem;
    mnuCompras: TMenuItem;
    opcNecessidades: TMenuItem;
    opcEmitirOC: TMenuItem;
    btnNecessidade: TToolButton;
    btnEmitirOC: TToolButton;
    ToolButton5: TToolButton;
    opcRelOCEmitida: TMenuItem;
    opcNumeroOC: TMenuItem;
    opcDataEmissao: TMenuItem;
    opcRelLogMensal: TMenuItem;
    opcEditaEstado: TMenuItem;
    btnEditaEstado: TToolButton;
    procedure opcFamiliaCategoriaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure tmrRelogioTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure opcMarcasClick(Sender: TObject);
    procedure MostraDicas(Sender: TObject);
    procedure opcProdutosClick(Sender: TObject);
    procedure opcFornecedoresClick(Sender: TObject);
    procedure opcFuncionariosClick(Sender: TObject);
    procedure opcClientesClick(Sender: TObject);
    procedure opcNotaFiscalClick(Sender: TObject);
    procedure opcDevolucaoClick(Sender: TObject);
    procedure opcVendasClick(Sender: TObject);
    procedure opcPerdasClick(Sender: TObject);
    procedure opcRelFamiliaCodigoClick(Sender: TObject);
    procedure opcRelCategoriaCodigoClick(Sender: TObject);
    procedure opcRelGrupoFamiliaClick(Sender: TObject);
    procedure opcRelMarcaCodigoClick(Sender: TObject);
    procedure opcRelFornecedorCodigoClick(Sender: TObject);
    procedure opcRelProdutoCodigoClick(Sender: TObject);
    procedure opcRelFuncionarioCodigoClick(Sender: TObject);
    procedure opcRelClienteAlfaClick(Sender: TObject);
    procedure opcNecessidadesClick(Sender: TObject);
    procedure opcEmitirOCClick(Sender: TObject);
    procedure opcNumeroOCClick(Sender: TObject);
    procedure opcDataEmissaoClick(Sender: TObject);
    procedure opcRelLogMensalClick(Sender: TObject);
    procedure opcEditaEstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMenuPrincipal: TformMenuPrincipal;

implementation

uses FamiliaCategoria, RotinasGerais, Marcas, Produtos, Fornecedores,
  Funcionarios, Clientes, EntraCompras, Devolucao, Vendas, Perdas,
  RelFamilias, ModuloDados, RelCategorias, RelGrupoFamilia, RelMarcas,
  RelFornecedores, RelProdutos, RelFuncionarios, RelClientes, Necessidades,
  OrdemCompra, NumeroOC, DataOC, RelOrdemCompra, LogMensal, EditaEstados;

{$R *.DFM}

procedure TformMenuPrincipal.opcFamiliaCategoriaClick(Sender: TObject);
begin
     formFamiliaCategoria.ShowModal;
end;

procedure TformMenuPrincipal.FormShow(Sender: TObject);
begin
     with formMenuPrincipal do
     begin
          Top    := 0;
          Left   := 0;
          Width  := Screen.Width;
          Height := Screen.Height;
     end;
     imgFundo.Picture.LoadFromFile('FUNDO.JPG');
     stsInforma.Panels[0].Text := MostraData(Date);
     stsInforma.Panels[2].Text := '';
end;

procedure TformMenuPrincipal.mnuSairClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TformMenuPrincipal.tmrRelogioTimer(Sender: TObject);
begin
     stsInforma.Panels[1].Text := TimeToStr(Time);
end;

procedure TformMenuPrincipal.MostraDicas(Sender: TObject);
begin
    formMenuPrincipal.stsInforma.Panels[2].Text := Application.Hint;
end;

procedure TformMenuPrincipal.FormCreate(Sender: TObject);
begin
     Application.OnHint := MostraDicas;
end;

procedure TformMenuPrincipal.opcMarcasClick(Sender: TObject);
begin
     formMarcas.ShowModal;
end;

procedure TformMenuPrincipal.opcProdutosClick(Sender: TObject);
begin
     formProdutos.ShowModal;
end;

procedure TformMenuPrincipal.opcFornecedoresClick(Sender: TObject);
begin
     formFornecedores.ShowModal;
end;

procedure TformMenuPrincipal.opcFuncionariosClick(Sender: TObject);
begin
     formFuncionarios.ShowModal;
end;

procedure TformMenuPrincipal.opcClientesClick(Sender: TObject);
begin
     formClientes.ShowModal;
end;

procedure TformMenuPrincipal.opcNotaFiscalClick(Sender: TObject);
begin
     formEntradaCompra.ShowModal;
end;

procedure TformMenuPrincipal.opcDevolucaoClick(Sender: TObject);
begin
     formDevolucao.ShowModal;
end;

procedure TformMenuPrincipal.opcVendasClick(Sender: TObject);
begin
     formVendasBalcao.ShowModal;
end;

procedure TformMenuPrincipal.opcPerdasClick(Sender: TObject);
begin
     formPerdas.ShowModal;
end;

procedure TformMenuPrincipal.opcRelFamiliaCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblFamilias.Open;
     if (Sender = opcRelFamiliaAlfa) then
     begin
          dmBaseDados.tblFamilias.IndexName := 'IndDescricao';
          formRelFamilia.lblOrdem.Caption := 'ORDEM DE DESCRIÇÃO';
     end
     else
         formRelFamilia.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelFamilia.rptFamilias.Preview;
     dmBaseDados.tblFamilias.IndexName := '';
     dmBaseDados.tblFamilias.Close;
end;

procedure TformMenuPrincipal.opcRelCategoriaCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblCategorias.Open;
     if (Sender = opcRelCategoriaAlfa) then
     begin
          dmBaseDados.tblCategorias.IndexName := 'IndDescricao';
          formRelCategoria.lblOrdem.Caption := 'ORDEM DE DESCRIÇÃO';
     end
     else
         formRelCategoria.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelCategoria.rptCategorias.Preview;
     dmBaseDados.tblCategorias.IndexName := '';
     dmBaseDados.tblCategorias.Close;
end;

procedure TformMenuPrincipal.opcRelGrupoFamiliaClick(Sender: TObject);
begin
     dmBaseDados.tblFamilias.Open;
     dmBaseDados.tblCategorias.Open;
     formRelGrupoFamilia.rptGrupoFamilia.Preview;
     dmBaseDados.tblFamilias.Close;
     dmBaseDados.tblCategorias.Close;
end;

procedure TformMenuPrincipal.opcRelMarcaCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Open;
     if (Sender = opcRelMarcaAlfa) then
     begin
          dmBaseDados.tblMarcas.IndexName := 'IndMarca';
          formRelMarca.lblOrdem.Caption := 'ORDEM DE DESCRIÇÃO';
     end
     else
         formRelMarca.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelMarca.rptMarcas.Preview;
     dmBaseDados.tblMarcas.IndexName := '';
     dmBaseDados.tblMarcas.Close;
end;

procedure TformMenuPrincipal.opcRelFornecedorCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Open;
     if (Sender = opcRelFornecedorCGC) then
     begin
          dmBaseDados.tblFornecedores.IndexName := 'IndCGC';
          formRelFornecedor.lblOrdem.Caption := 'ORDEM DE C.G.C.';
     end
     else if (Sender = opcRelFornecedorNome) then
          begin
               dmBaseDados.tblFornecedores.IndexName := 'IndFornecedor';
               formRelFornecedor.lblOrdem.Caption := 'ORDEM DE NOME FANTASIA';
          end
     else if (Sender = opcRelFornecedorTipo) then
          begin
               dmBaseDados.tblFornecedores.IndexName := 'IndTipo';
               formRelFornecedor.lblOrdem.Caption := 'ORDEM DE TIPO DE FORNECEDOR';
          end
     else
         formRelFornecedor.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelFornecedor.rptFornecedores.Preview;
     dmBaseDados.tblFornecedores.IndexName := '';
     dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.opcRelProdutoCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblMarcas.Open;
     dmBaseDados.tblMarcas.MasterSource := dmBaseDados.dsProdutos;
     dmBaseDados.tblMarcas.MasterFields := 'CodigoMarca';
     if (Sender = opcRelProdutoAlfa) then
     begin
          dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
          formRelProduto.lblOrdem.Caption := 'ORDEM DE DESCRIÇÃO ABREVIADA';
     end
     else if (Sender = opcRelProdutoReferencia) then
          begin
               dmBaseDados.tblProdutos.IndexName := 'IndReferencia';
               formRelProduto.lblOrdem.Caption := 'ORDEM DE REFERÊNCIA DE FABRICANTE';
          end
     else
         formRelProduto.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelProduto.rptProdutos.Preview;
     dmBaseDados.tblProdutos.IndexName := '';
     dmBaseDados.tblMarcas.MasterFields := '';
     dmBaseDados.tblMarcas.MasterSource := nil;
     dmBaseDados.tblMarcas.Open;
     dmBaseDados.tblProdutos.Close;
end;

procedure TformMenuPrincipal.opcRelFuncionarioCodigoClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Open;
     if (Sender = opcRelFuncionarioAlfa) then
     begin
          dmBaseDados.tblFuncionarios.IndexName := 'IndFuncionario';
          formRelFuncionario.lblOrdem.Caption := 'ORDEM DE NOME';
     end
     else
         formRelFuncionario.lblOrdem.Caption := 'ORDEM DE CÓDIGO';
     formRelFuncionario.rptFuncionarios.Preview;
     dmBaseDados.tblFuncionarios.IndexName := '';
     dmBaseDados.tblFuncionarios.Close;
end;

procedure TformMenuPrincipal.opcRelClienteAlfaClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Open;
     if (Sender = opcRelClienteAlfa) then
     begin
          dmBaseDados.tblClientes.IndexName := 'IndCliente';
          formRelCliente.lblOrdem.Caption := 'ORDEM DE NOME';
     end
     else
         formRelCliente.lblOrdem.Caption := 'ORDEM DE RG';
     formRelCliente.rptClientes.Preview;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Close;
end;

procedure TformMenuPrincipal.opcNecessidadesClick(Sender: TObject);
begin
     formNecessidade.ShowModal;
end;

procedure TformMenuPrincipal.opcEmitirOCClick(Sender: TObject);
begin
     formOrdemCompra.ShowModal;
end;

procedure TformMenuPrincipal.opcNumeroOCClick(Sender: TObject);
begin
     formNumeroOC.ShowModal;
     dmBaseDados.tblNumeroOC.Open;
     dmBaseDados.tblRelOC.Open;
     dmBaseDados.tblRelOC.IndexName    := 'IndOrdemCompra';
     dmBaseDados.tblRelOC.MasterSource := dmBaseDados.dsNumeroOC;
     dmBaseDados.tblRelOC.MasterFields := 'OrdemCompra';
     if (dmBaseDados.tblRelOC.RecordCount <> 0) then
        formRelOC.rptOrdemCompra.Preview;
     dmBaseDados.tblRelOC.MasterFields := '';
     dmBaseDados.tblRelOC.MasterSource := nil;
     dmBaseDados.tblRelOC.IndexName    := '';
     dmBaseDados.tblRelOC.Close;
     dmBaseDados.tblNumeroOC.Close;
end;

procedure TformMenuPrincipal.opcDataEmissaoClick(Sender: TObject);
begin
     formDataOC.ShowModal;
     dmBaseDados.tblNumeroOC.Open;
     dmBaseDados.tblRelOC.Open;
     dmBaseDados.tblRelOC.IndexName    := 'IndOrdemCompra';
     dmBaseDados.tblRelOC.MasterSource := dmBaseDados.dsNumeroOC;
     dmBaseDados.tblRelOC.MasterFields := 'OrdemCompra';
     if (dmBaseDados.tblRelOC.RecordCount <> 0) then
        formRelOC.rptOrdemCompra.Preview;
     dmBaseDados.tblRelOC.MasterFields := '';
     dmBaseDados.tblRelOC.MasterSource := nil;
     dmBaseDados.tblRelOC.IndexName    := '';
     dmBaseDados.tblRelOC.Close;
     dmBaseDados.tblNumeroOC.Close;
end;

procedure TformMenuPrincipal.opcRelLogMensalClick(Sender: TObject);
begin
     formLogMensal.ShowModal;
end;

procedure TformMenuPrincipal.opcEditaEstadoClick(Sender: TObject);
begin
     formEditaEstado.ShowModal;
end;

end.

