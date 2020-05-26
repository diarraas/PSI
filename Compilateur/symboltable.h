#ifndef SYMBOLTABLE_H_ 
#define SYMBOLTABLE_H_
#include <stdio.h>
#include <stdlib.h>


/*
    types
*/

typedef struct symbol {
    char* name ;
    int address;
    int type; //0 for const
    int init; //1 for initialized
    int depth;

}symbol ;




void add_variable(char* name) ;

void add_const(char* name) ;

int add_temp();

void increase_depth();

void decrease_depth();

int get_depth();

int find_symbol_address(char* name);

void free_temp();

void reset_depth();

void print_table();





#endif