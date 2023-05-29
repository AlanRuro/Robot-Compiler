%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s);
extern FILE *yyin;
%}

%token NOUN OPENING_KIND_WORD ENDING_KIND_WORD VERB DEGREES NUM_BLOCK EOL NEXUS
%%
 
INSTRUCTIONS: INSTRUCTION	{ printf("PASS\n"); };
| INSTRUCTIONS EOL INSTRUCTIONS
| INSTRUCTIONS EOL
;

INSTRUCTION: OPENING_KIND_WORD NOUN SENTENCE
| NOUN SENTENCE ENDING_KIND_WORD
;

SENTENCE: TURN_PHRASE NEXUS SENTENCE
| MOVE_PHRASE NEXUS SENTENCE
| TURN_PHRASE
| MOVE_PHRASE
;

TURN_PHRASE: VERB DEGREES
| VERB DEGREES 'degrees'
;

MOVE_PHRASE: VERB NUM_BLOCK
| VERB NUM_BLOCK 'blocks'
;


%%

void yyerror(const char *s) {
	printf("FAIL\n");
}

int main(int argc, char **argv) {
    if (argc != 2) {
	fprintf(stderr, "Cant open");
	exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
	perror("fopen");
	exit(1);
    }
    yyparse();
    fclose(yyin);
    return 0;
}
         


