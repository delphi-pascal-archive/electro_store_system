unit SeekCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TformSeekCliente = class(TForm)
    lblMensagem: TLabel;
    mskCliente: TMaskEdit;
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
  formSeekCliente: TformSeekCliente;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformSeekCliente.FormShow(Sender: TObject);
begin
     mskCliente.Text := '';
     mskCliente.SetFocus;
end;

procedure TformSeekCliente.btnOKClick(Sender: TObject);
begin
     if (not dmBaseDados.tblClientes.FindKey([mskCliente.Text])) then
     begin
          Mensagem('Cliente não encontrado !');
          dmBaseDados.tblClientes.First;
     end;
end;

end.
