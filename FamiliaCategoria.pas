unit FamiliaCategoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TformFamiliaCategoria = class(TForm)
    grpFamilias: TGroupBox;
    grpCategorias: TGroupBox;
    btnAnterior1: TSpeedButton;
    btnProximo1: TSpeedButton;
    btnUltimo1: TSpeedButton;
    btnLocalizar1: TSpeedButton;
    btnExcluir1: TSpeedButton;
    btnPrimeiro2: TSpeedButton;
    btnAnterior2: TSpeedButton;
    btnProximo2: TSpeedButton;
    btnUltimo2: TSpeedButton;
    btnLocalizar2: TSpeedButton;
    btnExcluir2: TSpeedButton;
    btnRetornar: TBitBtn;
    grdFamilias: TDBGrid;
    grdCategorias: TDBGrid;
    btnPrimeiro1: TSpeedButton;
    btnAdicionar1: TSpeedButton;
    btnAdicionar2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnPrimeiro1Click(Sender: TObject);
    procedure btnAnterior1Click(Sender: TObject);
    procedure btnProximo1Click(Sender: TObject);
    procedure btnUltimo1Click(Sender: TObject);
    procedure btnLocalizar1Click(Sender: TObject);
    procedure btnExcluir1Click(Sender: TObject);
    procedure btnAdicionar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFamiliaCategoria: TformFamiliaCategoria;

implementation

uses ModuloDados, RotinasGerais, SeekFamilia, SeekCategoria;

{$R *.DFM}

procedure TformFamiliaCategoria.FormShow(Sender: TObject);
begin
     dmBaseDados.tblFamilias.Open;
     dmBaseDados.tblCategorias.Open;
     dmBaseDados.tblCategorias.MasterSource := dmBaseDados.dsFamilias;
     dmBaseDados.tblCategorias.MasterFields := 'CodigoFamilia';
end;

procedure TformFamiliaCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblCategorias.MasterFields := '';
     dmBaseDados.tblCategorias.MasterSource := nil;
     dmBaseDados.tblFamilias.Close;
     dmBaseDados.tblCategorias.Close;
end;

procedure TformFamiliaCategoria.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

procedure TformFamiliaCategoria.btnPrimeiro1Click(Sender: TObject);
begin
     if (Sender = btnPrimeiro1) then
     begin
          dmBaseDados.tblFamilias.First;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.First;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnAnterior1Click(Sender: TObject);
begin
     if (Sender = btnAnterior1) then
     begin
          dmBaseDados.tblFamilias.Prior;
          if (dmBaseDados.tblFamilias.Bof) then
          begin
               InicioTabela;
               dmBasedados.tblFamilias.First;
          end;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.Prior;
          if (dmBaseDados.tblCategorias.Bof) then
          begin
               InicioTabela;
               dmBasedados.tblCategorias.First;
          end;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnProximo1Click(Sender: TObject);
begin
     if (Sender = btnProximo1) then
     begin
          dmBaseDados.tblFamilias.Next;
          if (dmBaseDados.tblFamilias.Eof) then
          begin
               FimTabela;
               dmBasedados.tblFamilias.Last;
          end;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.Next;
          if (dmBaseDados.tblCategorias.Eof) then
          begin
               FimTabela;
               dmBasedados.tblCategorias.Last;
          end;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnUltimo1Click(Sender: TObject);
begin
     if (Sender = btnUltimo1) then
     begin
          dmBaseDados.tblFamilias.Last;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.Last;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnLocalizar1Click(Sender: TObject);
begin
     if (Sender = btnLocalizar1) then
     begin
          formSeekFamilia.ShowModal;
          grdFamilias.SetFocus;
     end
     else
     begin
          formSeekCategoria.ShowModal;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnExcluir1Click(Sender: TObject);
begin
     if (Sender = btnExcluir1) then
     begin
          dmBaseDados.tblFamilias.Delete;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.Delete;
          grdCategorias.SetFocus;
     end;
end;

procedure TformFamiliaCategoria.btnAdicionar1Click(Sender: TObject);
begin
     if (Sender = btnAdicionar1) then
     begin
          dmBaseDados.tblFamilias.Append;
          grdFamilias.SetFocus;
     end
     else
     begin
          dmBaseDados.tblCategorias.Append;
          grdCategorias.SetFocus;
     end;
end;

end.
