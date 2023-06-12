%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { return GREETINGS; };
please                    	{ return KIND_WORD; };
move|turn	                { return VERB; };
90|180|270|360            { yylval = atoi(yytext); return DEGREES; };
[1-9]                       { yylval = atoi(yytext); return NUM_BLOCK; };
degrees                     { return WORD_DEGREES; }; 
blocks                      { return WORD_BLOCKS; }; 
and|then|"and then"         { return NEXUS; }
[ \t] ;			            /* ignore whitespace */
\n                          { return EOL; };		/* logical EOF */
. return 0;

 
%%   
