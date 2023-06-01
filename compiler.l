%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { printf("Robot"); return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { printf("Greetings"); return GREETINGS; };
please                    	{ printf("KindWord"); return KIND_WORD; };
move|turn	                { printf("Verb"); return VERB; };
0|90|180|270|360            { printf("Degree"); yylval = atoi(yytext); return DEGREES; };
[1-9]                       { printf("Block"); yylval = atoi(yytext); return NUM_BLOCK; };
degrees                     { printf("DegreesWord"); return WORD_DEGREES; }; 
blocks                      { printf("BlocksWord"); return WORD_BLOCKS; }; 
and|then|"and then"         { printf("Nexus"); return NEXUS; }
[ \t] ;			/* ignore whitespace */
\n { printf("EOL"); return EOL; };		/* logical EOF */
. return 0;

 
%%   
