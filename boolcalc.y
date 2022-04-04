%{
#include <stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}


%token BOOLEAN VARIABLE
%token AND OR NOT XOR
%left AND OR NOT XOR
%%
program:
program statement '\n'
|
;
statement:
expr {
    if ($1 == 0) {
        printf("FALSE\n");
    } else {
        printf("TRUE\n");
    }
}
| VARIABLE '=' expr { sym[$1] = $3; }
| statement ',' statement
;


expr:
BOOLEAN  { $$ = $1; }
| '(' expr ')'    { $$ = $2; }
| expr expr AND   { $$ = $1 * $3;}
| expr expr OR   { if($1==1||$3 ==1){$$=1;}else{$$=0;} }
| expr NOT       { if($2==1){ $$=0; }else{ $$=1;} }
| expr expr XOR   { if( $1 ==0 && $3==1 || $1 ==1 && $3==0){ $$=1; }else{$$=0 ;} }


;
%%
#include "lex.yy.c"
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
