all:
	lex compiler.l
	gcc lex.yy.c -o compiler -ll

clean:
	rm -rf compiler
	rm -rf lex.yy.c