%{
#include <stdio.h>
%}


ABC     abc

%%

{ABC}    { printf("ABC"); }    
.        { printf("%s", yytext); }
%%

int main() {
    printf("Enter the input string: ");
    yylex();  
    return 0;
}

int yywrap() {
    return 1;
}
