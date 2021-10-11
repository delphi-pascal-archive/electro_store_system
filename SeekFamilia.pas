unit SeekFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TformSeekFamilia = class(TForm)
    lblMensagem: TLabel;
    mskFamilia: TMaskEdit;
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
  formSeekFamilia: TformSeekFamilia;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekFamilia.FormShow(Sender: TObject);
begin
     mskFamilia.Text := '';
     mskFamilia.SetFocus;
end;

procedure TformSeekFamilia.btnOKClick(Sender: TObject);
begin
     if (not dmBaseDados.tblFamilias.FindKey([mskFamilia.Text])) then
     begin
          Mensagem('Registro não encontrado !');
          dmBaseDados.tblFamilias.First;
     end;
end;

end.
