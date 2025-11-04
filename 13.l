%{
#include <stdio.h>
%}


VALID   [6-9][0-9]{9}

%%

^{VALID}$   { printf("Valid Mobile Number\n"); }
.*          { printf("Invalid Mobile Number\n"); }

%%

int main() {
    printf("Enter a mobile number: ");
    yylex();   
    return 0;
}

int yywrap() {
    return 1;
}
