%{
    #include <stdio.h>
%}

%%
[Rr]obot			{ printf("Noun\n"); };
please	            { printf("Kind word\n"); };
move|turn	        { printf("Verb\n"); };
0|90|180|270|360    { printf("Degree\n"); };
[ \t] ;			/* ignore whitespace */
\n return EOF;		/* logical EOF */
. return 0;

 
%%   