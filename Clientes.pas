unit Clientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Buttons;

type
  TformClientes = class(TForm)
    lblMatricula: TLabel;
    lblNomeCliente: TLabel;
    fldNomeCliente: TDBEdit;
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
    fldRG: TDBEdit;
    fldCIC: TDBEdit;
    lblCIC: TLabel;
    lblFAX: TLabel;
    fldFax: TDBEdit;
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
  formClientes: TformClientes;

implementation

uses ModuloDados, RotinasGerais, SeekCliente;

{$R *.DFM}

procedure TformClientes.FormShow(Sender: TObject);
var
   FArquivo: TextFile;
   strDados: string;
begin
     dmBaseDados.tblClientes.Open;
     AssignFile(FArquivo,'C:\SGE\TABELAS\ESTADOS.TXT');
     Reset(FArquivo);
     ReadLn(FArquivo,strDados);
     while (not Eof(FArquivo)) do
     begin
          fldEstado.Items.Add(strDados);
          ReadLn(FArquivo,strDados);
     end;
     CloseFile(FArquivo);
     if (dmBaseDados.tblClientes.RecordCount = 0) then
        dmBaseDados.tblClientes.Append;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblClientes.Close;
end;

procedure TformClientes.btnPrimeiroClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.First;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnAnteriorClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Prior;
     if (dmBaseDados.tblClientes.Bof) then
     begin
          InicioTabela;
          dmBasedados.tblClientes.First;
     end;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnProximoClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Next;
     if (dmBaseDados.tblClientes.Eof) then
     begin
          FimTabela;
          dmBasedados.tblClientes.Last;
     end;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnUltimoClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Last;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnGravarClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Post;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnLocalizarClick(Sender: TObject);
begin
     formSeekCliente.ShowModal;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Delete;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnAdicionarClick(Sender: TObject);
begin
     dmBaseDados.tblClientes.Append;
     fldNomeCliente.SetFocus;
end;

procedure TformClientes.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

end.
