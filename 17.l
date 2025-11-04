%{
#include <stdio.h>
%}

URL    (https?:\/\/)[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}(\/[a-zA-Z0-9._\/-]*)?

%%

^{URL}$    { printf("Valid URL\n"); }
.*         { printf("Invalid URL\n"); }

%%

int main() {
    printf("Enter a URL: ");
    yylex();   
    return 0;
}

int yywrap() {
    return 1;
}
