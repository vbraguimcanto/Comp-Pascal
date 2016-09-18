%{

/*	Analisador Léxico - Pascal :: Flex	
* 	Victor Hugo Braguim Canto
*	RA: 151026041
*/
#include <string.h>

int linhas = 0;
int totlinhas = 0;

%}

DIGITO 		[0-9]
NUMERO 		{DIGITO}+(\.{DIGITO}+)?(E[+-]?{DIGITO}+)?
PALAVRA 	[a-zA-Z]
ID 			{PALAVRA}({PALAVRA}|{DIGITO})*
OPERADOR 	[-+*/]
DOISPONTOS	:
ATRIBUICAO  :=
DM 			[ \t]
WS    		{DM}+


%%
{WS} 			{/*no action and no return*/}
program  		{ printf("<program>: \t\t \"%s %8d\"\n", yytext,linhas);}
begin  			{ printf("<BEGIN>: \t\t \"%s %8d\"\n", yytext,linhas);}
if     			{ printf("<IF>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
then   			{ printf("<THEN>: \t\t \"%s %8d\"\n", yytext,linhas);}
else   			{ printf("<ELSE>: \t\t \"%s %8d\"\n", yytext,linhas);}
write  			{ printf("<WRITE>: \t\t \"%s %8d\"\n", yytext,linhas);}
read			{ printf("<READ>: \t\t \"%s %8d\"\n", yytext,linhas);}
readLn			{ printf("<READLN>: \t\t \"%s %8d\"\n", yytext,linhas);}
writeLn			{ printf("<WRITELN>: \t\t \"%s %8d\"\n", yytext,linhas);}
for				{ printf("<FOR>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
to				{ printf("<TO>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
do				{ printf("<DO>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
while			{ printf("<while>: \t\t \"%s %8d\"\n", yytext,linhas);}
repeat			{ printf("<REPEAT>: \t\t \"%s %8d\"\n", yytext,linhas);}
until			{ printf("<UNTIL>: \t\t \"%s %8d\"\n", yytext,linhas);}
var				{ printf("<VAR>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
and				{ printf("<OP_LOGICO_AND>: \t \"%s %8d\"\n", yytext,linhas);}
not				{ printf("<OP_LOGICO_NOT>: \t \"%s %8d\"\n", yytext,linhas);}
or				{ printf("<OP_LOGICO_OR>: \t \"%s %8d\"\n", yytext,linhas);}
end				{ printf("<END>: \t\t\t \"%s %8d\"\n", yytext,linhas);}
integer			{ printf("<T_INTEGER>: \t\t \"%s %8d\"\n", yytext,linhas);}
char			{ printf("<T_CHAR>: \t\t \"%s %8d\"\n", yytext,linhas);}
real			{ printf("<T_REAL>: \t\t \"%s %8d\"\n", yytext,linhas);}
{NUMERO}		{ printf("<NUMERO>: \t\t \"%s %8d\"\n", yytext,linhas);}
{ID}			{ printf("<IDENTIFICADOR>: \t \"%s %8d\"\n", yytext,linhas);}
{OPERADOR}		{ printf("<OPERADOR>: \t\t \"%s %8d\"\n", yytext,linhas);  }
{ATRIBUICAO}	{ printf("<ATRIBUICAO>: \t\t \"%s %8d\"\n", yytext,linhas);  }
{DOISPONTOS}	{ printf("<DOIS_PONTOS>: \t\t \"%s %8d\"\n", yytext,linhas); }
";"				{ printf("<PONTO_VIRG>: \t\t \"%s %8d\"\n", yytext,linhas); }
"("				{ printf("<ABRE_PARENTESES>: \t \"%s %8d\"\n", yytext,linhas);  }
")"				{ printf("<FECHA_PARENTESES>: \t \"%s %8d\"\n", yytext,linhas);  }
"<"				{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
"<="			{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
"="				{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
"<>"			{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
">"				{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
">="			{ printf("<OP_COMPARACAO>: \t \"%s %8d\"\n", yytext,linhas); }
"'"				{ printf("<ASPAS_SIMPLES>: \t \"%s %8d\"\n", yytext,linhas);}
","				{ printf("<VIRGULA>: \t\t \"%s %8d\"\n", yytext,linhas); }
"."				{ printf("<PONTO>: \t\t \"%s %8d\"\n", yytext,linhas);}
\n 				{ linhas++; printf("<PULOU_LINHA>: \t\t \"%s %8d\"\n", yytext,linhas); }
.				{ printf("<ERRO_LEXICO>: \t\t \"%s %8d\"\n", yytext,linhas); }

%%

int main ( int nArgs, char* szArgs[]) {
	yylex();
	printf("%8d\n", linhas);
	return 0;
}
