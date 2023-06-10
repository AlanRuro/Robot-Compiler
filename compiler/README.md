# Deliverable 2: Lex analyzer

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
