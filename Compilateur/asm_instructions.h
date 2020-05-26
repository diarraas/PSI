#ifndef ASM_INSTRUCTIONS_H 
#define ASM_INSTRUCTIONS_H
#include <stdio.h>
#include <stdlib.h>

typedef struct asm_code {
    int line_nb ;
    char * code ;
} asm_code ;


void add_inst(int result, int op1, int op2);

void mul_inst(int result, int op1, int op2);

void sub_inst(int result, int op1, int op2);

void div_inst(int result, int op1, int op2);

void inf_inst(int result, int op1, int op2);

void sup_inst(int result, int op1, int op2);

void equ_inst(int result, int op1, int op2);

void afc_inst(int result, int op);

void cop_inst(int result, int op);

void pri_inst(int result);

int jmp_inst(int address);

int jmpf_inst();

void insert(char * code);

void print_asm_instructions();

void patch(int from, int to);

int get_nb_lines();

#endif