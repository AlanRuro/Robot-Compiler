%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[Rr]obot			        { printf("Robot\n"); return NOUN; };
[Hh]ello|[Hh]i	            { printf("Open kind word\n"); return OPENING_KIND_WORD; };
goodbye|please|thanks	    { printf("End kind word\n"); return ENDING_KIND_WORD; };
move|turn	                { printf("Verb\n"); return VERB; };
0|90|180|270|360            { printf("Degree\n"); return DEGREES; };
[1-9]                       { printf("Block\n"); return NUM_BLOCK; }
and|then                    { printf("Nexo\n"); return NEXUS;  }
[ \t] ;			/* ignore whitespace */
\n { printf("EOL\n"); return EOL;};		/* logical EOF */
. return 0;

 
%%   
