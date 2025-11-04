%{
#include <stdio.h>

int number_count = 0, word_count = 0;
%}

%%
[0-9]+ { number_count++; printf("Number: %s\n", yytext); }
[a-zA-Z]+ { word_count++; printf("Word: %s\n", yytext); }
. { /* Ignore other characters */ }
%%

int main() {
    printf("Enter a statement: \n");
    yylex();
    printf("Total Numbers: %d\n", number_count);
    printf("Total Words: %d\n", word_count);
    return 0;
}

int yywrap() {
    return 1;
}

