%{
#include <stdio.h>
%}

/* Pattern for valid DOB (DD-MM-YYYY or DD/MM/YYYY):
   - Day: 01-31
   - Month: 01-12
   - Year: 1900-2099
*/
DOB    ((0[1-9])|([12][0-9])|(3[01]))[-/]((0[1-9])|(1[0-2]))[-/]((19|20)[0-9]{2})

%%

^{DOB}$    { printf("Valid DOB\n"); }
.*         { printf("Invalid DOB\n"); }

%%

int main() {
    printf("Enter DOB (DD-MM-YYYY or DD/MM/YYYY): ");
    yylex();   /* Start lexical analysis */
    return 0;
}

int yywrap() {
    return 1;
}
