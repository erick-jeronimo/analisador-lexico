package br.edu.unoesc;

import java_cup.runtime.*;

%%
%{

/*-*
*	funcoes e variaveis
*/

private void imprimir(String descricao, String lexema) {
	System.out.println(lexema + " - " + descricao); 
}

%}

/*-*
*	Informações sobre a classe gerada
*/

%public
%class AnalisadorLexico
%type void

/*-*
*	definicoes de regulares
*/

BRANCO = [\n| |\t]
ID = [_a-z|A-Z][a-z|A-Z|0-9|_]*
INTEIRO = 0|[1-9][0-9]*
PONTOFLUTUANTE = [0-9][0-9]*"."[0-9]+
OPERADORES_MATEMATICOS = ("+" | "-" | "*" | "/") 

%%

"if"       					 		{ imprimir("Instrucao if", yytext()); }
"then"      						{ imprimir("Instrucao then", yytext()); }
{BRANCO}     				   		{ imprimir("Branco", yytext()); }
{ID}      							{ imprimir("Identificador", yytext()); }
{INTEIRO}        					{ imprimir("Numero", yytext()); }
{PONTOFLUTUANTE}      				{ imprimir("Ponto flutuante", yytext()); }
{OPERADORES_MATEMATICOS}        	{ imprimir("Operadores matemáticos", yytext()); }

"=="								{ imprimir("Operador de igualdade", yytext()); }


.   {throw new RuntimeException("Caractere inválido \""+yytext() + 
								"\" na linha " +yyline+ ", na coluna "+yycolumn); }







 
