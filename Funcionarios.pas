unit Funcionarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons;

type
  TformFuncionarios = class(TForm)
    lblMatricula: TLabel;
    fldMatricula: TDBText;
    lblNomeFuncionario: TLabel;
    fldNomeFuncionario: TDBEdit;
    fldEndereco: TDBEdit;
    fldNumero: TDBEdit;
    fldBairro: TDBEdit;
    fldCidade: TDBEdit;
    fldCEP: TDBEdit;
    fldTelefone: TDBEdit;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    fldEstado: TDBComboBox;
    lblCEP: TLabel;
    lblTelefone: TLabel;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnGravar: TSpeedButton;
    btnLocalizar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnRetornar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFuncionarios: TformFuncionarios;

implementation

uses ModuloDados, RotinasGerais, SeekFuncionario;

{$R *.DFM}

procedure TformFuncionarios.FormShow(Sender: TObject);
var
   FArquivo: TextFile;
   strDados: string;
begin
     dmBaseDados.tblFuncionarios.Open;
     AssignFile(FArquivo,'C:\SGE\TABELAS\ESTADOS.TXT');
     Reset(FArquivo);
     ReadLn(FArquivo,strDados);
     while (not Eof(FArquivo)) do
     begin
          fldEstado.Items.Add(strDados);
          ReadLn(FArquivo,strDados);
     end;
     CloseFile(FArquivo);
     if (dmBaseDados.tblFuncionarios.RecordCount = 0) then
     begin
          dmBaseDados.tblFuncionarios.Append;
          dmBaseDados.tblFuncionariosCodigoFuncionario.AsString := '001';
          dmBaseDados.tblFuncionarios.Post;
     end;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblFuncionarios.Close;
end;

procedure TformFuncionarios.btnPrimeiroClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.First;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnAnteriorClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Prior;
     if (dmBaseDados.tblFuncionarios.Bof) then
     begin
          InicioTabela;
          dmBasedados.tblFuncionarios.First;
     end;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnProximoClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Next;
     if (dmBaseDados.tblFuncionarios.Eof) then
     begin
          FimTabela;
          dmBasedados.tblFuncionarios.Last;
     end;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnUltimoClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Last;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnGravarClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Post;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnLocalizarClick(Sender: TObject);
begin
     formSeekFuncionario.ShowModal;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblFuncionarios.Delete;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnAdicionarClick(Sender: TObject);
var
   intCodigo,intTamanho: integer;
   strCodigo: string;
begin
     dmBaseDados.tblFuncionarios.Last;
     intCodigo := StrToInt(dmBaseDados.tblFuncionariosCodigoFuncionario.AsString);
     Inc(intCodigo);
     strCodigo  := IntToStr(intCodigo);
     intTamanho := Length(strCodigo);
     strCodigo  := Copy('000'+strCodigo,intTamanho+1,3);
     dmBaseDados.tblFuncionarios.Append;
     dmBaseDados.tblFuncionariosCodigoFuncionario.AsString := strCodigo;
     dmBaseDados.tblFuncionarios.Post;
     fldNomeFuncionario.SetFocus;
end;

procedure TformFuncionarios.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

end.
