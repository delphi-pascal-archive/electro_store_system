unit SeekProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DB;

type
  TformSeekProduto = class(TForm)
    lblMensagem: TLabel;
    mskCodigo: TMaskEdit;
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
  formSeekProduto: TformSeekProduto;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekProduto.btnOKClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
   bmkRegistro: TBookMark;
begin
     bmkRegistro     := dmBaseDados.tblProdutos.GetBookMark;
     strCodFamilia   := Copy(mskCodigo.Text,1,3);
     strCodCategoria := Copy(mskCodigo.Text,4,3);
     strCodProduto   := Copy(mskCodigo.Text,7,6);
     if (not dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
     begin
          Mensagem('Produto não encontrado !');
          dmBaseDados.tblProdutos.GotoBookmark(bmkRegistro);
     end;
     dmBaseDados.tblProdutos.FreeBookmark(bmkRegistro);
end;

procedure TformSeekProduto.FormShow(Sender: TObject);
begin
     mskCodigo.Text := '';
     mskCodigo.SetFocus;
end;

end.
