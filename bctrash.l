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

"true"              {yylval=1;  return BOOLEAN;}
"false"             {yylval=0;  return BOOLEAN;}
"TRUE"              {yylval=1;  return BOOLEAN;}
"FALSE"             {yylval=0;  return BOOLEAN;}

[()=\n] { return *yytext; }
[ \t] ;
,  {return *yytext; }
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
