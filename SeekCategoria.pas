unit SeekCategoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TformSeekCategoria = class(TForm)
    lblMensagem: TLabel;
    mskCategoria: TMaskEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekCategoria: TformSeekCategoria;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekCategoria.FormShow(Sender: TObject);
begin
     mskCategoria.Text := '';
     mskCategoria.SetFocus;
end;

procedure TformSeekCategoria.btnOKClick(Sender: TObject);
var
   strFamilia: string[3];
begin
     strFamilia := dmBaseDados.tblFamiliasCodigoFamilia.AsString;
     if (not dmBaseDados.tblCategorias.FindKey([strFamilia,mskCategoria.Text])) then
     begin
          Mensagem('Registro não encontrado !');
          dmBaseDados.tblCategorias.First;
     end;
end;

end.
