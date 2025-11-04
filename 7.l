%{
#include <stdio.h>
%}

TAG     \<[^>]+>

%%

{TAG}   { printf("Tag: %s\n", yytext); }   
.|\n    ;                                  

%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();  /* Start scanning */
    return 0;
}

int yywrap() {
    return 1;
}
