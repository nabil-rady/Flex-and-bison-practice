%{
    #include <stdio.h>
    #include <stdlib.h>
    #define YYSTYPE char*
    int yylex();
    int yyerror();
    extern FILE* yyin;
%}

%token NUMBER
%token ID
%token INT
%token FLOAT
%token ASSIGN

%%
 
Program: Declaration Statements;

Declaration : |
Declaration INT ID { printf("INT ID "); }| Declaration FLOAT ID { printf("FLOAT ID "); } ;

Statements : |
Statements Statement;

Statement: ID ASSIGN NUMBER { printf("ID ASSIGN NUMBER "); };

%%
int main() {
    FILE* fp = fopen("test.txt", "r");
    yyin = fp;
    if(yyparse()!=0)
        printf("Error found.\n");
}
