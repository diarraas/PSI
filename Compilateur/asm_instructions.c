#include "asm_instructions.h"

#define MAX 500

int line_cmp = 0 ;
asm_code asm_table[MAX];

void add_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "ADD %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void mul_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "MUL %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void sub_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "SOU %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void div_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "DIV %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void inf_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "INF %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void sup_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "SUP %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void equ_inst(int result, int op1, int op2){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "EQU %d %d %d", result, op1, op2);
	insert(s);
    free(s);
}

void afc_inst(int result, int op){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "AFC %d %d", result, op);
	insert(s);
    free(s);
}

void cop_inst(int result, int op){
    char* s =  malloc(sizeof(char)*255);
	sprintf(s, "COP %d %d", result, op);
	insert(s);
    free(s);
}

void pri_inst(int result){
    char * s =  malloc(sizeof(char)*255);
	sprintf(s, "PRI %d", result);
	insert(s);
    free(s);
}

int jmp_inst(int address){
    if(address == 0){
        char * s =  malloc(sizeof(char)*255);
        sprintf(s, "JMP");
        insert(s);
        free(s);
    }else
    {
        char * s =  malloc(sizeof(char)*255);
        sprintf(s, "JMP %d",address);
        insert(s);
        free(s);
    }
    return line_cmp;
}

int jmf_inst(int address){
    char * s =  malloc(sizeof(char)*255);
	sprintf(s, "JMF %d", address);
	insert(s);
    free(s);
    int result = line_cmp ;
    return result;
}

void insert(char * codeasm){
    asm_code* a = malloc(sizeof(asm_code));
    a->line_nb = line_cmp ;
    a->code = strdup(codeasm);
    asm_table[line_cmp] = *a ;
    line_cmp += 1;
}


void print_asm_instructions(){
    FILE *fp;
    int i ;
    fp=fopen("Interpreter/asm_code", "w");
    for(i = 0; i< line_cmp; i++){
        char* s =  malloc(sizeof(char)*255);
        sprintf(s, "%s\n",asm_table[i].code);
        fprintf(fp, s);
        free(s);
    }
    fclose(fp);
}

void patch(int from, int to){
        asm_code* a = malloc(sizeof(asm_code));
        char * s =  malloc(sizeof(char)*255);
	    sprintf(s, "%s %d",asm_table[from].code,to);
        a->code = strdup(s);
        a->line_nb = from;
        asm_table[from] = *a;
        free(s);
}
   
   


int get_nb_lines(){
    return line_cmp ;
}
