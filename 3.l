%{
#include <stdio.h>

int vowel_count = 0;
%}

%%
[AEIOUaeiou][a-zA-Z]* { vowel_count++; printf("String starting with vowel: %s\n", yytext); }
. { /* Ignore other characters */ }
%%

int main() {
    printf("Enter a statement: \n");
    yylex();
    printf("Total Strings starting with vowel: %d\n", vowel_count);
    return 0;
}

int yywrap() {
    return 1;
}

