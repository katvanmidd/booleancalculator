%{
#include <stdlib.h>
void yyerror(char *);
#include "bctrash.tab.h"
%}
%%
not return NOT;
and return AND;
or return OR;
xor return XOR;
[a-z] {
         yylval = *yytext - 'a';
         return VARIABLE;
      }


[FALSE-TRUE]+ {
          yylval = atoi(yytext);
          return BOOLEAN;
       }


[()=\n] { return *yytext; }
[ \t] ;
,  {return *yytext; }
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}