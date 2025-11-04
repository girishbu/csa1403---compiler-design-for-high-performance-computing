%{
#include <stdio.h>

int macroCount = 0;
int headerCount = 0;
%}

MACRO      "#define"[^\n]*     
HEADER     "#include"[^\n]*      
%%

{MACRO}    { macroCount++; }    
{HEADER}   { headerCount++; }    
.|\n       ;                     

%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();  

    printf("Number of Macros Defined: %d\n", macroCount);
    printf("Number of Header Files Included: %d\n", headerCount);

    return 0;
}

int yywrap() {
    return 1;
}
