unit SeekFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, DB;

type
  TformSeekFornecedor = class(TForm)
    lblCodigoFornecedor: TLabel;
    mskCodigoFornecedor: TMaskEdit;
    lblNomeFantasia: TLabel;
    mskNomeFantasia: TMaskEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekFornecedor: TformSeekFornecedor;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekFornecedor.FormShow(Sender: TObject);
begin
     mskCodigoFornecedor.Text := '';
     mskNomeFantasia.Text := '';
     mskCodigoFornecedor.SetFocus;
end;

procedure TformSeekFornecedor.btnOKClick(Sender: TObject);
var
   bmkRegistro: TBookMark;
begin
     if ((mskCodigoFornecedor.Text <> '') and (mskCodigoFornecedor.Text <> '    ')) then
     begin
          bmkRegistro := dmBaseDados.tblFornecedores.GetBookMark;
          if (not dmBaseDados.tblFornecedores.FindKey([mskCodigoFornecedor.Text])) then
          begin
               Mensagem('Código do fornecedor não encontrado !');
               dmBaseDados.tblFornecedores.GotoBookMark(bmkRegistro);
          end;
          dmBaseDados.tblFornecedores.FreeBookMark(bmkRegistro);
     end
     else
     if ((mskNomeFantasia.Text <> '') and (mskNomeFantasia.Text <> '                    ')) then
     begin
          dmBaseDados.tblFornecedores.IndexName := 'IndFornecedor';
          bmkRegistro := dmBaseDados.tblFornecedores.GetBookMark;
          if (not dmBaseDados.tblFornecedores.FindKey([mskNomeFantasia.Text])) then
          begin
               Mensagem('Fornecedor não encontrado !');
               dmBaseDados.tblFornecedores.GotoBookMark(bmkRegistro);
          end;
          dmBaseDados.tblFornecedores.FreeBookMark(bmkRegistro);
          dmBaseDados.tblFornecedores.IndexName := '';
     end;
end;

end.
