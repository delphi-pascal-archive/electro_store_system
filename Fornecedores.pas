unit Fornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls;

type
  TformFornecedores = class(TForm)
    pgFornecedor: TPageControl;
    tabFornecedor: TTabSheet;
    fldCodigoFornecedor: TDBText;
    lblCodigoFornecedor: TLabel;
    lblNomeFantasia: TLabel;
    fldNomeFantasia: TDBEdit;
    lblRazaoSocial: TLabel;
    fldRazaoSocial: TDBEdit;
    lblCGC: TLabel;
    fldCGC: TDBEdit;
    lblTipoFornecedor: TLabel;
    fldTipoFornecedor: TDBComboBox;
    lblEndereco: TLabel;
    fldEndereco: TDBEdit;
    lblNumero: TLabel;
    fldNumero: TDBEdit;
    lblBairro: TLabel;
    fldBairro: TDBEdit;
    fldCidade: TDBEdit;
    lblCidade: TLabel;
    lblEstado: TLabel;
    fldCEP: TDBEdit;
    lblCEP: TLabel;
    fldEstado: TDBComboBox;
    fldTelefone: TDBEdit;
    fldFAX: TDBEdit;
    lblTelefone: TLabel;
    lblFAX: TLabel;
    lblRepresentante: TLabel;
    fldRepresentante: TDBEdit;
    fldRamal: TDBEdit;
    lblRamal: TLabel;
    lblHomePage: TLabel;
    lblEMail: TLabel;
    fldHomePage: TDBEdit;
    fldEMail: TDBEdit;
    tabProdutos: TTabSheet;
    grdProdutos: TDBGrid;
    pnlBotoes: TPanel;
    btnPrimeiroProduto: TSpeedButton;
    btnUltimoProduto: TSpeedButton;
    btnAdicionarProduto: TSpeedButton;
    btnGravarProduto: TSpeedButton;
    btnExcluirProduto: TSpeedButton;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnRetornar: TSpeedButton;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroProdutoClick(Sender: TObject);
    procedure btnUltimoProdutoClick(Sender: TObject);
    procedure btnGravarProdutoClick(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFornecedores: TformFornecedores;

implementation

uses ModuloDados, RotinasGerais, SeekFornecedor;

{$R *.DFM}

procedure TformFornecedores.btnPrimeiroClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.First;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnAnteriorClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Prior;
     if (dmBaseDados.tblFornecedores.Bof) then
     begin
          InicioTabela;
          dmBasedados.tblFornecedores.First;
     end;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnProximoClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Next;
     if (dmBaseDados.tblFornecedores.Eof) then
     begin
          FimTabela;
          dmBasedados.tblFornecedores.Last;
     end;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnUltimoClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Last;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnGravarClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Post;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblFornecedores.Delete;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnAdicionarClick(Sender: TObject);
var
   intCodigo,intTamanho: integer;
   strCodigo: string;
begin
     dmBaseDados.tblFornecedores.Last;
     intCodigo := StrToInt(dmBaseDados.tblFornecedoresCodigoFornecedor.AsString);
     Inc(intCodigo);
     strCodigo  := IntToStr(intCodigo);
     intTamanho := Length(strCodigo);
     strCodigo  := Copy('0000'+strCodigo,intTamanho+1,4);
     dmBaseDados.tblFornecedores.Append;
     dmBaseDados.tblFornecedoresCodigoFornecedor.AsString := strCodigo;
     dmBaseDados.tblFornecedores.Post;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

procedure TformFornecedores.FormShow(Sender: TObject);
var
   FArquivo: TextFile;
   strDados: string;
begin
     dmBaseDados.tblFornecedores.Open;
     dmBaseDados.tblProdutosFornecidos.Open;
     AssignFile(FArquivo,'C:\SGE\TABELAS\ESTADOS.TXT');
     Reset(FArquivo);
     ReadLn(FArquivo,strDados);
     while (not Eof(FArquivo)) do
     begin
          fldEstado.Items.Add(strDados);
          ReadLn(FArquivo,strDados);
     end;
     CloseFile(FArquivo);
     if (dmBaseDados.tblFornecedores.RecordCount = 0) then
     begin
          dmBaseDados.tblFornecedores.Append;
          dmBaseDados.tblFornecedoresCodigoFornecedor.AsString := '0001';
          dmBaseDados.tblFornecedores.Post;
     end;
     pgFornecedor.ActivePage := tabFornecedor;
     fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblFornecedores.Close;
     dmBaseDados.tblProdutosFornecidos.Close;
end;

procedure TformFornecedores.btnPrimeiroProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutosFornecidos.First;
     grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnUltimoProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutosFornecidos.Last;
     grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnGravarProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutosFornecidos.Post;
     grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnAdicionarProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutosFornecidos.Append;
     grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnExcluirProdutoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutosFornecidos.Delete;
     grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnLocalizarClick(Sender: TObject);
begin
    formSeekFornecedor.ShowModal;
end;

end.
