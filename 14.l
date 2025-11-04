%{
#include <stdio.h>
#include <string.h>

char *keywords[] = {
    "int", "float", "char", "double", "void", "if", "else", "while",
    "for", "return", "break", "continue", "switch", "case", "default",
    "struct", "typedef", "do", "sizeof", "long", "short", "signed",
    "unsigned", "static", "const", "main"
};
int numKeywords = 26;

int isKeyword(char *word) {
    for (int i = 0; i < numKeywords; i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

KEYWORD     [a-zA-Z_][a-zA-Z0-9_]*
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
CONSTANT    [0-9]+
STRING      \"([^\"\n]*)\"
OPERATOR    [+\-*/=<>!&|]
SYMBOL      [;:,{}()]

%%

"#".*                       { printf("Preprocessor Directive: %s\n", yytext); }
{KEYWORD} {
            if (isKeyword(yytext))
                printf("Keyword: %s\n", yytext);
            else
                printf("Identifier: %s\n", yytext);
          }
{CONSTANT}                  { printf("Constant: %s\n", yytext); }
{STRING}                    { printf("String Literal: %s\n", yytext); }
{OPERATOR}                  { printf("Operator: %s\n", yytext); }
{SYMBOL}                    { printf("Symbol: %s\n", yytext); }
[ \t\n]+                    ; 
.                           { printf("Invalid Token: %s\n", yytext); }

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
