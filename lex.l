%{
#define YYSTYPE char *
#include "stdlib.h"
#include "yacc.tab.h"
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
{number}  { yylval = strdup(yytext); return NUMBER; }
"int"  { yylval = strdup(yytext); return INT;}
"float"  { yylval = strdup(yytext); return FLOAT;}
{id}  { yylval = strdup(yytext); return ID;}
"="  { yylval = strdup(yytext); return ASSIGN;}

%%

int yyerror (void) {
    printf("Error\n");
}
