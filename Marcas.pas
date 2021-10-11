unit Marcas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids;

type
  TformMarcas = class(TForm)
    grdMarcas: TDBGrid;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnProximo: TSpeedButton;
    btnUltimo: TSpeedButton;
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
  formMarcas: TformMarcas;

implementation

uses ModuloDados, RotinasGerais, SeekMarca;

{$R *.DFM}

procedure TformMarcas.FormShow(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Open;
end;

procedure TformMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dmBaseDados.tblMarcas.Close;
end;

procedure TformMarcas.btnPrimeiroClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.First;
end;

procedure TformMarcas.btnAnteriorClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Prior;
     if (dmBaseDados.tblMarcas.Bof) then
     begin
          InicioTabela;
          dmBasedados.tblMarcas.First;
     end;
end;

procedure TformMarcas.btnProximoClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Next;
     if (dmBaseDados.tblMarcas.Eof) then
     begin
          FimTabela;
          dmBasedados.tblMarcas.Last;
     end;
end;

procedure TformMarcas.btnUltimoClick(Sender: TObject);
begin
     dmBasedados.tblMarcas.Last;
end;

procedure TformMarcas.btnLocalizarClick(Sender: TObject);
begin
     formSeekMarca.ShowModal;
end;

procedure TformMarcas.btnExcluirClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Delete;
end;

procedure TformMarcas.btnAdicionarClick(Sender: TObject);
begin
     dmBaseDados.tblMarcas.Append;
end;

procedure TformMarcas.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

end.
