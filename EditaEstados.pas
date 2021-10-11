unit EditaEstados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEditaEstado = class(TForm)
    memEstados: TMemo;
    btnOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEditaEstado: TformEditaEstado;

implementation

{$R *.DFM}

procedure TformEditaEstado.FormShow(Sender: TObject);
begin
     memEstados.Lines.LoadFromFile('C:\SGE\TABELAS\ESTADOS.TXT');
     memEstados.SetFocus;
end;

procedure TformEditaEstado.btnOKClick(Sender: TObject);
begin
     memEstados.Lines.SaveToFile('C:\SGE\TABELAS\ESTADOS.TXT');
end;

end.
