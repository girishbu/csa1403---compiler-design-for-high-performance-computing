%{
#include <stdio.h>

int charCount = 0;
int wordCount = 0;
int lineCount = 0;
%}

/* Patterns */
WORD    [^ \t\n]+    /* Sequence of non-whitespace characters */
NEWLINE \n
CHAR    .

%%

{WORD}      { wordCount++; charCount += yyleng; }
{NEWLINE}   { lineCount++; charCount++; }
[ \t]       { charCount++; }        
{CHAR}      { charCount++; }       

%%

int main(int argc, char *argv[]) {
    if (argc > 1)
        yyin = fopen(argv[1], "r");
    else
        yyin = stdin;

    yylex();

    printf("Number of Characters: %d\n", charCount);
    printf("Number of Words: %d\n", wordCount);
    printf("Number of Lines: %d\n", lineCount);

    return 0;
}

int yywrap() {
    return 1;
}
