%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { yylval.sval = strdup(yytext); return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { yylval.sval = strdup(yytext); return GREETINGS; };
please                    	{ yylval.sval = strdup(yytext); return KIND_WORD; };
move|turn	                { yylval.sval = strdup(yytext); return VERB; };
90|180|270|360              { yylval.ival = atoi(yytext); return DEGREES; };
[1-9]                       { yylval.ival = atoi(yytext); return NUM_BLOCK; };
degrees                     { yylval.sval = strdup(yytext); return WORD_DEGREES; }; 
blocks                      { yylval.sval = strdup(yytext); return WORD_BLOCKS; }; 
and|then|"and then"         { yylval.sval = strdup(yytext); return NEXUS; }
,                           { yylval.sval = strdup(yytext); return COMMA; }
[ \t] ;			            /* ignore whitespace */
\n|\r\n                          { return EOL; };		/* logical EOF */
. return 0;

 
%%   
