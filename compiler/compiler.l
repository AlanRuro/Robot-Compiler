%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { return GREETINGS; };
please                    	{ return KIND_WORD; };
move|turn	                { return VERB; };
90|180|270|360              { yylval = atoi(yytext); return DEGREES; };
[0-9]                       { yylval = atoi(yytext); return NUM_BLOCK; };
degrees                     { return WORD_DEGREES; }; 
blocks                      { return WORD_BLOCKS; }; 
and|then|"and then"         { return NEXUS; }
,                           { return COMMA; }
[ \t] ;			            /* ignore whitespace */
\n|\r\n                          { return EOL; };		/* logical EOF */

%%   
