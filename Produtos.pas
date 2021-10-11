unit Produtos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ComCtrls, Buttons, DB;

type
  TformProdutos = class(TForm)
    pgProduto: TPageControl;
    tabIdentificacao: TTabSheet;
    lblFamilia: TLabel;
    fldFamilia: TDBLookupComboBox;
    lblCategoria: TLabel;
    fldCategoria: TDBLookupComboBox;
    lblMarca: TLabel;
    fldMarca: TDBLookupComboBox;
    lblReferencia: TLabel;
    fldReferencia: TDBEdit;
    lblUnidade: TLabel;
    fldUnidade: TDBEdit;
    lblLocalizacao: TLabel;
    fldLocalizacao: TDBEdit;
    lblCodigo: TLabel;
    fldCodigo: TDBText;
    tabDescricao: TTabSheet;
    lblDescricaoAbreviada: TLabel;
    lblDescricaoDetalhada: TLabel;
    fldDescricaoAbreviada: TDBEdit;
    fldDescricaoDetalhada: TDBEdit;
    lblCaracteristicas: TLabel;
    fldCaracteristicas: TDBMemo;
    tabFoto: TTabSheet;
    scrlFoto: TScrollBox;
    fldFoto: TDBImage;
    tabValor: TTabSheet;
    lblValorAnterior: TLabel;
    fldVlAnterior: TDBEdit;
    lblValorAtual: TLabel;
    fldVlAtual: TDBEdit;
    lblMargemLucro: TLabel;
    fldMargemLucro: TDBEdit;
    lblVlVenda: TLabel;
    fldVlVenda: TDBEdit;
    lblDataUltimaCompra: TLabel;
    fldDataUltimaCompra: TDBEdit;
    tabEstoque: TTabSheet;
    lblEstoqueMinimo: TLabel;
    fldEstoqueMinimo: TDBEdit;
    lblPontoReposicao: TLabel;
    fldPontoReposicao: TDBEdit;
    lblEstoqueMaximo: TLabel;
    fldEstoqueMaximo: TDBEdit;
    lblEstoqueAtual: TLabel;
    fldEstoqueAtual: TDBEdit;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnGravar: TSpeedButton;
    btnRetornar: TSpeedButton;
    fldCodFamilia: TDBText;
    fldCodCategoria: TDBText;
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formProdutos: TformProdutos;

implementation

uses ModuloDados, RotinasGerais, SeekProduto;

{$R *.DFM}

procedure TformProdutos.FormShow(Sender: TObject);
begin
     dmBaseDados.tblFamilias.Open;
     dmBaseDados.tblCategorias.Open;
     dmBaseDados.tblMarcas.Open;
     dmBaseDados.tblProdutos.Open;
     if (dmBaseDados.tblProdutos.RecordCount = 0) then
        dmBaseDados.tblProdutos.Append;
     pgProduto.ActivePage := tabIdentificacao;
     fldFamilia.SetFocus;
end;

procedure TformProdutos.btnPrimeiroClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.First;
end;

procedure TformProdutos.btnAnteriorClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.Prior;
     if (dmBaseDados.tblProdutos.Bof) then
     begin
          InicioTabela;
          dmBasedados.tblProdutos.First;
     end;
end;

procedure TformProdutos.btnProximoClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.Next;
     if (dmBaseDados.tblProdutos.Eof) then
     begin
          FimTabela;
          dmBasedados.tblProdutos.Last;
     end;
end;

procedure TformProdutos.btnUltimoClick(Sender: TObject);
begin
     dmBasedados.tblProdutos.Last;
end;

procedure TformProdutos.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.Delete;
end;

procedure TformProdutos.btnAdicionarClick(Sender: TObject);
begin
     dmBaseDados.tblProdutos.Append;
     pgProduto.ActivePage := tabIdentificacao;
     fldFamilia.SetFocus;
end;

procedure TformProdutos.btnRetornarClick(Sender: TObject);
begin
     if ((dmBaseDados.tblProdutos.State = dsEdit) or (dmBaseDados.tblProdutos.State = dsInsert)) then
     begin
          if (Confirma('Há dados que não foram gravados !'+#13+'Grava alterações antes de fechar ?') = IDYES) then
          begin
               dmBaseDados.tblProdutos.Post;
               Close;
          end
          else
              Close;
     end
     else
         Close;
end;

procedure TformProdutos.btnLocalizarClick(Sender: TObject);
begin
     formSeekProduto.ShowModal;
end;

procedure TformProdutos.btnGravarClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strDigito: string;
   strCodigo: string[10];
   intCodigo,intContador,intTamanho,intFator,intSoma,intResto,intDigito: integer;
   fltResultado: double;
   bmkRegistro: TBookMark;
begin
     if ((dmBaseDados.tblProdutos.State = dsEdit) or (dmBaseDados.tblProdutos.State = dsInsert)) then
     begin
          dmBaseDados.tblProdutos.Post;
          if (dmBaseDados.tblProdutosCodigoProduto.AsString = '') then
          begin
               bmkRegistro     := dmBaseDados.tblProdutos.GetBookMark;
               strCodFamilia   := dmBaseDados.tblProdutosCodigoFamilia.AsString;
               strCodCategoria := dmBaseDados.tblProdutosCodigoCategoria.AsString;
               intCodigo       := 0;
               dmBaseDados.tblProdutos.Next;
               while ((dmBaseDados.tblProdutosCodigoFamilia.AsString = strCodFamilia) and (dmBaseDados.tblProdutosCodigoCategoria.AsString = strCodCategoria) and (not dmBaseDados.tblProdutos.Eof)) do
               begin
                    strCodProduto := dmBaseDados.tblProdutosCodigoProduto.AsString;
                    intCodigo     := StrToInt(Copy(strCodProduto,1,4));
                    dmBaseDados.tblProdutos.Next;
               end;
               Inc(intCodigo);
               strCodProduto := IntToStr(intCodigo);
               intTamanho    := Length(strCodProduto);
               strCodProduto := Copy('0000'+strCodProduto,intTamanho+1,4);
               strCodigo     := strCodFamilia+strCodCategoria+strCodProduto;
               intFator      := 10;
               intSoma       := 0;
               for intContador := 1 to 10 do
               begin
                    intSoma  := intSoma + (StrToInt(strCodigo[intContador])*intFator);
                    intFator := intFator - 1;
               end;
               fltResultado := intSoma / 11;
               intResto     := intSoma - (Trunc(fltResultado) * 11);
               intDigito    := 11-intResto;
               if (intDigito > 9) then
                  intDigito := 0;
               strDigito := Format('%1d',[intDigito]);
               strCodProduto := strCodProduto+'-'+strDigito;
               dmBaseDados.tblProdutos.GotoBookmark(bmkRegistro);
               dmBaseDados.tblProdutos.FreeBookmark(bmkRegistro);
               dmBaseDados.tblProdutos.Edit;
               dmBaseDados.tblProdutosCodigoProduto.AsString := strCodProduto;
               dmBaseDados.tblProdutos.Post;
          end;
     end;
end;

procedure TformProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblFamilias.Close;
     dmBaseDados.tblCategorias.Close;
     dmBaseDados.tblMarcas.Close;
     dmBaseDados.tblProdutos.Close;
end;

end.
