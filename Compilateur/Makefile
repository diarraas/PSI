all: compilator
compilator : y.tab.o lex.yy.o symboltable.o asm_instructions.o
	gcc -Wall y.tab.o lex.yy.o symboltable.o asm_instructions.o -o compilator
y.tab.c : analyse_yacc
	yacc --verbose --debug -v -d analyse_yacc
lex.yy.c : analyse_lex 
	lex analyse_lex 
yacc.o : y.tab.c y.tab.h
	gcc -c y.tab.c y.tab.h

