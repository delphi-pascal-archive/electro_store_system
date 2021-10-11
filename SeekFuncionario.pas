unit SeekFuncionario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TformSeekFuncionario = class(TForm)
    lblMensagem: TLabel;
    mskFuncionario: TMaskEdit;
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
  formSeekFuncionario: TformSeekFuncionario;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekFuncionario.FormShow(Sender: TObject);
begin
     mskFuncionario.Text := '';
     mskFuncionario.SetFocus;
end;

procedure TformSeekFuncionario.btnOKClick(Sender: TObject);
begin
     if (not dmBaseDados.tblFuncionarios.FindKey([mskFuncionario.Text])) then
     begin
          Mensagem('Funcionário não encontrado !');
          dmBaseDados.tblFuncionarios.First;
     end;
end;

end.
