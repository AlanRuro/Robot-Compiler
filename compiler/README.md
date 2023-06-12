# Deliverable 2: Lex analyzer

## Description of the problem

Industry 4.0 encompasses intelligent manufacturing and the emergence of smart factories, which have recently extended their influence to the mechanical industry. This expansion is driven by the rapid advancement of technology and the growing demand for high-quality products with increased efficiency. Consequently, the role of robots has become crucial, highlighting the significance of robot programming languages. To address this challenge, the development and implementation of a robust robot language compiler are necessary.

## Lex Code Explanation

```lex
%{
#include "y.tab.h"
#include <stdio.h>
%}
```

The section above specifies any necessary header files and preprocessor directives.

```lex
%%
[Rr]obot	            { printf("Robot"); return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { printf("Greetings"); return GREETINGS; };
please                      { printf("KindWord"); return KIND_WORD; };
move|turn	            { printf("Verb"); return VERB; };
90|180|270|360              { printf("Degree"); yylval = atoi(yytext); return DEGREES; };
[1-9]                       { printf("Block"); yylval = atoi(yytext); return NUM_BLOCK; };
degrees                     { printf("DegreesWord"); return WORD_DEGREES; };
blocks                      { printf("BlocksWord"); return WORD_BLOCKS; };
and|then|"and then"         { printf("Nexus"); return NEXUS; }
[ \t] ;			    /* ignore whitespace */
\n                          { printf("EOL"); return EOL; };		/* logical EOF */
. return 0;
```

The section above contains the Lex rules and corresponding actions. Here's an explanation of each rule:

- `[Rr]obot` matches the word "Robot" with either an uppercase or lowercase 'R'. It prints "Robot" and returns the token type `NOUN`.
- `[Hh]ello|[Hh]i|[Hh]ey` matches variations of greetings, such as "Hello," "Hi," or "Hey." It prints "Greetings" and returns the token type `GREETINGS`.
- `please` matches the word "please." It prints "KindWord" and returns the token type `KIND_WORD`.
- `move|turn` matches either "move" or "turn." It prints "Verb" and returns the token type `VERB`.
- `90|180|270|360` matches specific degree values (90, 180, 270, 360). It prints "Degree," converts the matched text to an integer using `atoi`, assigns it to `yylval`, and returns the token type `DEGREES`.
- `[1-9]` matches a single digit from 1 to 9. It prints "Block," converts the matched text to an integer using `atoi`, assigns it to `yylval`, and returns the token type `NUM_BLOCK`.
- `degrees` matches the word "degrees." It prints "DegreesWord" and returns the token type `WORD_DEGREES`.
- `blocks` matches the word "blocks." It prints "BlocksWord" and returns the token type `WORD_BLOCKS`.
- `and|then|"and then"` matches the words "and," "then," or the phrase "and then." It prints "Nexus" and returns the token type `NEXUS`.
- `[ \t] ;` ignores whitespace and semicolons.
- `\n` matches a newline character. It prints "EOL" (End of Line) and returns the token type `EOL`.
- `.` matches any other character. It returns 0, indicating the end of the Lex code.

```lex
%%
```

This section marks the end of the Lex code.

## Token Types

The Lex code defines several token types for different patterns:

- `NOUN`: Represents the word "Robot."
- `GREETINGS`: Represents variations of greetings like "Hello," "Hi," or "Hey."
- `KIND_WORD`: Represents the word "please."

- `VERB`: Represents verbs like "move" or "turn."
- `DEGREES`: Represents degree values (90, 180, 270, 360).
- `NUM_BLOCK`: Represents single-digit numbers from 1 to 9.
- `WORD_DEGREES`: Represents the word "degrees."
- `WORD_BLOCKS`: Represents the word "blocks."
- `NEXUS`: Represents the words "and," "then," or the phrase "and then."
- `EOL`: Represents the end of a line.

## Action Outputs

The Lex code includes `printf` statements to output the corresponding token type for each matched pattern. These statements can be modified or removed as per your requirements.

Make sure to include the necessary header files and update the token types in "y.tab.h" to match the corresponding values used in the Lex code.

## List of Sample Inputs to be Detected or Rejected

| Sample Input | Detection/Rejection |
|--------------|---------------------|
| Robot        | Detected (NOUN)     |
| robot        | Detected (NOUN)     |
| Hello        | Detected (GREETINGS)|
| Hi           | Detected (GREETINGS)|
| Hey          | Detected (GREETINGS)|
| Please       | Detected (KIND_WORD)|
| Move         | Detected (VERB)     |
| Turn         | Detected (VERB)     |
| 90           | Detected (DEGREES)  |
| 180          | Detected (DEGREES)  |
| 270          | Detected (DEGREES)  |
| 360          | Detected (DEGREES)  |
| 1            | Detected (NUM_BLOCK)|
| 2            | Detected (NUM_BLOCK)|
| Degrees      | Detected (WORD_DEGREES) |
| Blocks       | Detected (WORD_BLOCKS) |
| And          | Detected (NEXUS)    |
| Then         | Detected (NEXUS)    |
| And then     | Detected (NEXUS)    |
| ;            | Ignored (Whitespace)|
| \n           | Detected (EOL)      |
| Anything else| Rejected            |

Inputs like "Robot," "Hello," "Please," "Move," "90," "1," "Degrees," "And," ";," and "\n" would be detected and assigned the corresponding token types. Inputs like "robot," "hi," "turn," "180," "2," "blocks," "then," and "and then" would also be detected.

Any other input that does not match the defined patterns would be rejected and not assigned a token type.

# Deliverable 3: YACC grammar

## Description of the problem

Industry 4.0 encompasses intelligent manufacturing and the emergence of smart factories, which have recently extended their influence to the mechanical industry. This expansion is driven by the rapid advancement of technology and the growing demand for high-quality products with increased efficiency. Consequently, the role of robots has become crucial, highlighting the significance of robot programming languages. To address this challenge, the development and implementation of a robust robot language compiler are necessary.

## YACC Code Explanation

```yacc
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
```

The section above specifies the necessary header files and preprocessor directives.

```yacc
%token NOUN GREETINGS KIND_WORD VERB DEGREES NUM_BLOCK WORD_DEGREES WORD_BLOCKS EOL NEXUS
%%
```

The section above lists the token types used in the grammar rules. These token types are defined in the Lex code and shared with YACC.

```yacc
INSTRUCTIONS: INSTRUCTION                                   { printf("PASS\n"); };
| INSTRUCTION EOL INSTRUCTIONS
| INSTRUCTION EOL
;

INSTRUCTION: GREETINGS NOUN KIND_WORD SENTENCE
| NOUN KIND_WORD SENTENCE
| NOUN SENTENCE KIND_WORD
;

SENTENCE: TURN_PHRASE NEXUS SENTENCE
| MOVE_PHRASE NEXUS SENTENCE
| TURN_PHRASE
| MOVE_PHRASE
;

TURN_PHRASE: VERB DEGREES WORD_DEGREES                       { fprintf(outputFile, "turn,%d\n", $2); }
;

MOVE_PHRASE: VERB NUM_BLOCK WORD_BLOCKS                    { fprintf(outputFile, "mov,%d\n", $2); }
;
```

The section above defines the grammar rules and corresponding actions. Here's an explanation of each rule:

- `INSTRUCTIONS` represents a sequence of one or more `INSTRUCTION` rules. It prints "PASS" to indicate successful parsing.
- `INSTRUCTION` represents an instruction phrase. It can have different word orders and combinations.
- `SENTENCE` represents a sentence or a sequence of sentences. It can contain `TURN_PHRASE` or `MOVE_PHRASE` followed by `NEXUS` and another `SENTENCE`.
- `TURN_PHRASE` represents a phrase that includes a verb (`VERB`), degrees value (`DEGREES`), and the word "degrees" (`WORD_DEGREES`). It writes the corresponding output to the `outputFile`.
- `MOVE_PHRASE` represents a phrase that includes a verb (`VERB`), a number of blocks (`NUM_BLOCK`), and the word "blocks" (`WORD_BLOCKS`). It writes the corresponding output to the `outputFile`.

```yacc
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
    outputFile = fopen("../cpu/src/instructions.asm", "w");
    if (!outputFile) {
        perror("fopen");
        exit(1);
    }
    yyparse();
    if (errorFlag) {
        freopen("../cpu/src/instructions.asm", "w", outputFile);
    }
    fclose(outputFile);
    fclose(yyin);
    return 0;
}
```

The section above includes the `yyerror` function, which handles error reporting. It prints "FAIL" to indicate a parsing failure.

The `main` function sets up the input and output files, calls the parser (`yyparse`), and handles any errors that occur during parsing.

## Error Handling

The YACC code

 includes an `yyerror` function to handle error reporting. It prints "FAIL" to indicate a parsing failure. The `errorFlag` variable is set to 1 in the `yyerror` function, indicating the occurrence of an error during parsing.

## Input and Output

The YACC code expects a command-line argument specifying the input file to be parsed. The `yyin` file pointer is set to the input file.

The `outputFile` file pointer is opened in write mode to create the file "../cpu/src/instructions.asm" where the output instructions will be written.

If the parsing process encounters an error (`errorFlag` is set to 1), the `outputFile` is reopened in write mode to clear any partially written output.

## Token Types

The YACC code uses token types defined in the Lex code. These token types are shared between Lex and YACC and must match the corresponding token types used in the Lex code. The token types used in the YACC code are:

- `NOUN`
- `GREETINGS`
- `KIND_WORD`
- `VERB`
- `DEGREES`
- `NUM_BLOCK`
- `WORD_DEGREES`
- `WORD_BLOCKS`
- `EOL`
- `NEXUS`

Make sure to include the necessary header files and update the token types in the "y.tab.h" file to match the corresponding values used in the YACC code.

## Output Instructions

The YACC code includes `fprintf` statements to write the corresponding output instructions to the `outputFile`. The output format is specific to the instructions being parsed. Make sure to review and modify these statements as per your requirements.

## Definition of CFG (Context-Free Grammar)

A Context-Free Grammar (CFG) is a formal grammar used to describe the syntax of a programming language or any other language. It consists of a set of production rules that define how valid sentences can be formed in the language. Each production rule has a non-terminal symbol on the left-hand side and a sequence of non-terminal and/or terminal symbols on the right-hand side.

In the provided YACC code, the CFG consists of the following production rules:

```
INSTRUCTIONS: INSTRUCTION;
             | INSTRUCTION EOL INSTRUCTIONS
             | INSTRUCTION EOL;

INSTRUCTION: GREETINGS NOUN KIND_WORD SENTENCE
           | NOUN KIND_WORD SENTENCE
           | NOUN SENTENCE KIND_WORD;

SENTENCE: TURN_PHRASE NEXUS SENTENCE
         | MOVE_PHRASE NEXUS SENTENCE
         | TURN_PHRASE
         | MOVE_PHRASE;

TURN_PHRASE: VERB DEGREES WORD_DEGREES;

MOVE_PHRASE: VERB NUM_BLOCK WORD_BLOCKS;
```

## List of Sample Inputs to be Detected or Rejected

Here is a list of sample inputs that can be used to test the YACC parser:

1. Valid Inputs:
   - "Hello Robot, please move 3 blocks and turn 90 degrees."
   - "Hi, turn 180 degrees and then move 5 blocks."
   - "Robot, move 2 blocks and then turn 270 degrees."
   - "Turn 360 degrees and then move 1 block."

2. Invalid Inputs:
   - "Greetings Robot, please turn and move blocks." (Missing degree value and number of blocks)
   - "Hello, move 4 blocks and then." (Incomplete sentence)
   - "Robot, turn 90 degrees and then turn." (Consecutive "turn" instructions without a verb in between)
   - "Move blocks and then turn 180 degrees." (Missing number of blocks)

These sample inputs cover different combinations of greetings, instructions, verb phrases, and degree/block values. They can help ensure that the YACC parser correctly detects and rejects invalid inputs while correctly parsing and extracting relevant information from valid inputs. 
