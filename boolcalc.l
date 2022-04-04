%{
#include <stdlib.h>
void yyerror(char *);
#include "boolcalc.tab.h"
%}
%%
not return NOT;
NOT return NOT;
! return NOT;
and return AND;
AND return AND;
& return AND;
or return OR;
OR return OR;
"|" return OR;
xor return XOR;
XOR return XOR;
XoR return XOR;

[a-z,!,&,"|",A-Z] {
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
