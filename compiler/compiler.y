%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s);
extern FILE *yyin;
FILE *outputFile;
int errorFlag = 0;
%}

%token NOUN GREETINGS KIND_WORD VERB DEGREES NUM_BLOCK WORD_DEGREES WORD_BLOCKS EOL NEXUS COMMA
 
%%
 
INSTRUCTIONS: INSTRUCTION                                   
| INSTRUCTION EOL INSTRUCTIONS                              
| INSTRUCTION EOL                                           
;

INSTRUCTION: GREETINGS NOUN KIND_WORD COMPLEX_SENTENCE
| NOUN KIND_WORD COMPLEX_SENTENCE
| NOUN COMPLEX_SENTENCE KIND_WORD
;

COMPLEX_SENTENCE: SENTENCE
| SENTENCE NEXUS PHRASE
;

SENTENCE: PHRASE COMMA SENTENCE
| PHRASE
;

PHRASE: TURN_PHRASE
| MOVE_PHRASE
;

TURN_PHRASE: VERB DEGREES WORD_DEGREES                       { fprintf(outputFile, "turn,%d\n", $2); }
;

MOVE_PHRASE: VERB NUM_BLOCK WORD_BLOCKS                      { fprintf(outputFile, "mov,%d\n", $2); }
;


%%

void yyerror(const char *s) {
	printf("FAIL\n");
    errorFlag = 1;
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
    outputFile = fopen("instructions.asm", "w");
    if (!outputFile) {
        perror("fopen");
        exit(1);
    }
    yyparse();
    if (errorFlag) {
        freopen("instructions.asm", "w", outputFile);
    }
    fclose(outputFile);
    fclose(yyin);
    return 0;
}
         


