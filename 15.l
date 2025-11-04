%{
#include <stdio.h>
#include <string.h>

char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default",
    "do", "double", "else", "enum", "extern", "float", "for",
    "goto", "if", "int", "long", "register", "return", "short",
    "signed", "sizeof", "static", "struct", "switch", "typedef",
    "union", "unsigned", "void", "volatile", "while"
};
int numKeywords = 32;

int isKeyword(char *word) {
    for (int i = 0; i < numKeywords; i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*

%%

{IDENTIFIER} {
                if (isKeyword(yytext))
                    printf("Keyword: %s\n", yytext);
                else
                    printf("Identifier: %s\n", yytext);
             }
[ \t\n]+      ;  
.             ; 

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
