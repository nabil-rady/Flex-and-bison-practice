%{
#define YYSTYPE char ∗
#include "stdlib.h"
int lineno = 1;
%}

%option nounistd
%option noyywrap
%option never-interactive

white [ \r\t]+
letter [a-zA-Z]
digit [0-9]+
number [+-]?{digit}+("."{digit}+)?
id {letter}({letter}|{digit})*

%%

{white} { }
{number}  printf("NUMBER\n"); 
"int"  printf("INT\n");
"float" printf("FLOAT\n");
{id} { printf("ID\n"); }
"=" { printf("ASSIGN\n" ) ; }


%%

int yyerror (void) {
    printf ( " Error \n " ) ;
}

int main () {
    FILE* fp = fopen("test.txt", "r");
    yyin=fp ;
    yylex() ;
}
