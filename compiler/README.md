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


## List of Sample Inputs to be Detected or Rejected
