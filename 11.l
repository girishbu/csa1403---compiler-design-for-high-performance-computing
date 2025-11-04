%{
#include <stdio.h>
%}

EMAIL   [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}

%%

^{EMAIL}$    { printf("Valid Email Address\n"); }
.*           { printf("Invalid Email Address\n"); }

%%

int main() {
    printf("Enter an email address: ");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
