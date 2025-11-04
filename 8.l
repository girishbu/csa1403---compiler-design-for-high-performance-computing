%{
#include <stdio.h>

int lineNumber = 1;
%}

%%

.*\n    { printf("%d: %s", lineNumber++, yytext); }  
.+      { printf("%d: %s\n", lineNumber++, yytext); } 
%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
