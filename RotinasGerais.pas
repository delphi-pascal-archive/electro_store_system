unit RotinasGerais;

interface

uses Forms, Windows, SysUtils;

// Declaração dos procedimentos
procedure InicioTabela;
procedure FimTabela;
procedure Mensagem(strTexto: string);

// Declaração das funções
function Excluir: integer;
function Confirma(strTexto: string): integer;
function MostraData(dtData: TDateTime): string;

implementation

// Rotina para apresentar uma caixa de mensagem.
procedure Mensagem(strTexto: string);
begin
     Application.MessageBox(PChar(strTexto),'Mensagem',mb_OK + mb_IconInformation);
end;

// Rotina para apresentar mensagem de início dos registros.
procedure InicioTabela;
begin
     Mensagem('Início dos registros');
end;

// Rotina para apresentar mensagem de fim dos registros.
procedure FimTabela;
begin
     Mensagem('Fim dos registros');
end;

// Função para pedir confirmação da exclusão de um registro.
function Excluir: integer;
begin
     Result := Application.MessageBox('Deseja excluir esse registro ?','Exclusão',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

// Função para pedir confirmação de uma operação.
function Confirma(strTexto: string): integer;
begin
     Result := Application.MessageBox(PChar(strTexto),'Confirmação',mb_YesNo+mb_DefButton2+mb_IconQuestion);
end;

// Função para apresentação de uma data no formato 'Dia da semana - Dia do mês/Mês/Ano'.
function MostraData(dtData: TDateTime): string;
var
   intDiaSemana: integer;
   strDiaSemana: string;
begin
     intDiaSemana := DayOfWeek(dtData);
     case intDiaSemana of
          1: strDiaSemana := 'Domingo - ';
          2: strDiaSemana := 'Segunda-feira - ';
          3: strDiaSemana := 'Terça-feira - ';
          4: strDiaSemana := 'Quarta-feira - ';
          5: strDiaSemana := 'Quinta-feira - ';
          6: strDiaSemana := 'Sexta-feira - ';
          7: strDiaSemana := 'Sábado - ';
     end;
     Result := strDiaSemana+DateToStr(dtData);
end;

end.
