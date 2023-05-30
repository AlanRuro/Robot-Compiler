%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { printf("Robot"); return NOUN; };
[Hh]ello|[Hh]i          	{ printf("Open kind word"); return OPENING_KIND_WORD; };
goodbye|please|thanks	    { printf("End kind word"); return ENDING_KIND_WORD; };
move|turn	                { printf("Verb"); return VERB; };
0|90|180|270|360            { printf("Degree"); yylval = atoi(yytext); return DEGREES; };
[1-9]                       { printf("Block"); yylval = atoi(yytext); return NUM_BLOCK; }
[ \t] ;			/* ignore whitespace */
\n return EOL;		/* logical EOF */
. return 0;

 
%%   
