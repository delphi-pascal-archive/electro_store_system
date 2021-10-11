unit RotinasGerais;

interface

uses Forms, Windows, SysUtils;

// Declara��o dos procedimentos
procedure InicioTabela;
procedure FimTabela;
procedure Mensagem(strTexto: string);

// Declara��o das fun��es
function Excluir: integer;
function Confirma(strTexto: string): integer;
function MostraData(dtData: TDateTime): string;

implementation

// Rotina para apresentar uma caixa de mensagem.
procedure Mensagem(strTexto: string);
begin
     Application.MessageBox(PChar(strTexto),'Mensagem',mb_OK + mb_IconInformation);
end;

// Rotina para apresentar mensagem de in�cio dos registros.
procedure InicioTabela;
begin
     Mensagem('In�cio dos registros');
end;

// Rotina para apresentar mensagem de fim dos registros.
procedure FimTabela;
begin
     Mensagem('Fim dos registros');
end;

// Fun��o para pedir confirma��o da exclus�o de um registro.
function Excluir: integer;
begin
     Result := Application.MessageBox('Deseja excluir esse registro ?','Exclus�o',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

// Fun��o para pedir confirma��o de uma opera��o.
function Confirma(strTexto: string): integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Confirma��o',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

// Fun��o para apresenta��o de uma data no formato 'Dia da semana - Dia do m�s/M�s/Ano'.
function MostraData(dtData: TDateTime): string;
var
   intDiaSemana: integer;
   strDiaSemana: string;
begin
     intDiaSemana := DayOfWeek(dtData);
     case intDiaSemana of
          1: strDiaSemana := 'Domingo - ';
          2: strDiaSemana := 'Segunda-feira - ';
          3: strDiaSemana := 'Ter�a-feira - ';
          4: strDiaSemana := 'Quarta-feira - ';
          5: strDiaSemana := 'Quinta-feira - ';
          6: strDiaSemana := 'Sexta-feira - ';
          7: strDiaSemana := 'S�bado - ';
     end;
     Result := strDiaSemana+DateToStr(dtData);
end;

end.
