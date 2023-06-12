![descarga](https://github.com/AlanRuro/Robot-Compiler/assets/66846209/23f2cebd-87bf-49c5-8f2d-aa454aa624ca)

<h1 align="center">Robot Compiler</h1>

<h4 align="center">
  Created by:
</h4>

<p align="center">
  Diego Partida Romero - A01641113<br>
  Carlos Alberto Veryan Peña - A01641147<br>
  Alan Antonio Ruelas Robles - A01641426
</p>

<h3 align="center">Students of Tecnológico de Monterrey Campus GDA</h3>

<h4 align="center">Implementation of Computational Methods (Gpo 601) - TC2037.601</h4>

<h4 align="center">June 11, 2023</h4>

---

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
[Rr]obot	            { return NOUN; };
[Hh]ello|[Hh]i|[Hh]ey       { return GREETINGS; };
please                      { return KIND_WORD; };
move|turn	            { return VERB; };
90|180|270|360              { yylval = atoi(yytext); return DEGREES; };
[1-9]                       { yylval = atoi(yytext); return NUM_BLOCK; };
degrees                     { return WORD_DEGREES; };
blocks                      { return WORD_BLOCKS; };
and|then|"and then"         { return NEXUS; }
,                           { return COMMA; }
[ \t] ;			    /* ignore whitespace */
\n                          { return EOL; };		/* logical EOF */
. return 0;
```

The section above contains the Lex rules and corresponding actions. Here's an explanation of each rule:

- `[Rr]obot` matches the word "Robot" with either an uppercase or lowercase 'R'. It returns the token type `NOUN`.
- `[Hh]ello|[Hh]i|[Hh]ey` matches variations of greetings, such as "Hello," "Hi," or "Hey." It returns the token type `GREETINGS`.
- `please` matches the word "please." It returns the token type `KIND_WORD`.
- `move|turn` matches either "move" or "turn." It returns the token type `VERB`.
- `90|180|270|360` matches specific degree values (90, 180, 270, 360). It converts the matched text to an integer using `atoi`, assigns it to `yylval`, and returns the token type `DEGREES`.
- `[1-9]` matches a single digit from 1 to 9. It converts the matched text to an integer using `atoi`, assigns it to `yylval`, and returns the token type `NUM_BLOCK`.
- `degrees` matches the word "degrees." It returns the token type `WORD_DEGREES`.
- `blocks` matches the word "blocks." It returns the token type `WORD_BLOCKS`.
- `and|then|"and then"` matches the words "and," "then," or the phrase "and then." It returns the token type `NEXUS`.
- `,` matches a comma. It returns the token COMMA.
- `[ \t] ;` ignores whitespace and semicolons.
- `\n` matches a newline character. It returns the token type `EOL`.
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
- `COMMA`: Represents the word ",".
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
| ,            | Detected (COMMA)    |
| ;            | Ignored (Whitespace)|
| \n           | Detected (EOL)      |
| Anything else| Rejected            |

Inputs like "Robot," "Hello," "Please," "Move," "90," "1," "Degrees," "And," ";," and "\n" would be detected and assigned the corresponding token types. Inputs like "robot," "hi," "turn," "180," "2," "blocks," "then," and "and then" would also be detected.

Any other input that does not match the defined patterns would be rejected and not assigned a token type.

# Deliverable 3: YACC grammar

## Description of the problem

Industry 4.0 encompasses intelligent manufacturing and the emergence of smart factories, which have recently extended their influence to the mechanical industry. This expansion is driven by the rapid advancement of technology and the growing demand for high-quality products with increased efficiency. Consequently, the role of robots has become crucial, highlighting the significance of robot programming languages. To address this challenge, the development and implementation of a robust robot language compiler are necessary.

## Declarations

The code begins with a declarations section, which includes necessary header files, function declarations, and global variables.

```c
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

In this case, the code includes `<stdio.h>`, `<stdlib.h>`, and `<string.h>` header files. It declares the `yylex()` function, which is responsible for lexical analysis. It also declares the `yyerror()` function, which handles parsing errors. The `yyin` variable represents the input file, and the `outputFile` variable represents the output file. The `errorFlag` variable is used to track parsing errors.

## Token Definitions

The next section defines the tokens used in the grammar. Each token is associated with a symbolic name (`%token`) and should match the token definitions in the Lex file.

```c
%token NOUN GREETINGS KIND_WORD VERB DEGREES NUM_BLOCK WORD_DEGREES WORD_BLOCKS EOL NEXUS COMMA
```

In this case, the tokens correspond to various parts of the language defined by the grammar, such as nouns, greetings, verbs, degrees, blocks, etc.

## Grammar Rules and Actions

After the token definitions, the code defines the grammar rules and the corresponding actions to be executed when each rule is recognized.

```c
%%
 
INSTRUCTIONS: INSTRUCTION                                   { printf("PASS\n"); };
| INSTRUCTION EOL INSTRUCTIONS                              { printf("PASS\n"); };
| INSTRUCTION EOL                                           { printf("PASS\n"); };
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

TURN_PHRASE: VERB DEGREES WORD_DEGREES                       { if (!errorFlag) fprintf(outputFile, "turn,%d\n", $2); }
;

MOVE_PHRASE: VERB NUM_BLOCK WORD_BLOCKS                      { if (!errorFlag) fprintf(outputFile, "mov,%d\n", $2); }
;
```

In this code, each rule is defined using non-terminal symbols, followed by a colon (`:`) and the production rule. The production rule can consist of terminals, non-terminals, and actions.

Here's a breakdown of the grammar rules:

- The `INSTRUCTIONS` rule represents a list of instructions. It can be a single `INSTRUCTION`, an `INSTRUCTION` followed by an end-of-line (`EOL`) and more `INSTRUCTIONS`, or just an `INSTRUCTION` followed by an end-of-line.
- The `INSTRUCTION` rule defines different forms of instructions. It can start with a `GREETINGS`, followed by a `NOUN`, a `KIND_WORD`, and a `COMPLEX_SENTENCE`. Alternatively, it can start with a `NOUN` followed by a `KIND_WORD`

 and a `COMPLEX_SENTENCE`. It can also start with a `NOUN`, followed by a `COMPLEX_SENTENCE`, and end with a `KIND_WORD`.
- The `COMPLEX_SENTENCE` rule represents a complex sentence. It can be a single `SENTENCE` or a `SENTENCE` followed by a `NEXUS` and a `PHRASE`.
- The `SENTENCE` rule defines a sentence. It can be a `PHRASE` followed by a comma (`COMMA`) and another `SENTENCE`, or just a single `PHRASE`.
- The `PHRASE` rule represents a phrase. It can be a `TURN_PHRASE` or a `MOVE_PHRASE`.
- The `TURN_PHRASE` rule defines a phrase for turning. It consists of a `VERB`, a `DEGREES`, and a `WORD_DEGREES`. The associated action writes the corresponding assembly instruction to the `outputFile`.
- The `MOVE_PHRASE` rule defines a phrase for moving. It consists of a `VERB`, a `NUM_BLOCK`, and a `WORD_BLOCKS`. The associated action writes the corresponding assembly instruction to the `outputFile`.

## Error Handling

The Yacc code also includes an error handling function `yyerror()`.

```c
void yyerror(const char *s) {
    printf("FAIL\n");
    errorFlag = 1;
}
```

This function is called when a parsing error occurs. It prints "FAIL" and sets the `errorFlag` to 1.

## Main Function

The code ends with the `main()` function, which initializes the input and output files, performs the parsing using `yyparse()`, and closes the files.

```c
int main(int argc, char **argv) {
    // ...
    yyparse();
    // ...
    return 0;
}
```

## List of Sample Inputs to be Detected or Rejected

- **Valid Inputs:**

  1. Greetings Robot please turn 90 degrees.
  2. Hello Robot move 2 blocks, turn 180 degrees, and then move 5 blocks.
  3. Robot move 3 blocks and then turn 270 degrees.
  4. Hi Robot turn 360 degrees.

- **Invalid Inputs:**

  1. Robot please move blocks. (Missing the number of blocks)
  2. Turn 90 degrees and then move 2 blocks. (Missing the noun before the instruction)
  3. Greetings please move 3 blocks. (Missing the noun after the greeting)
  4. Hello Robot turn 90 degrees and move 2 blocks, then turn 180 degrees. (Incorrect order of instructions)
