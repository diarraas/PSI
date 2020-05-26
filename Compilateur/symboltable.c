#include "symboltable.h"

#define MAX 50

int current_address = 0;

int current_depth = 0 ;

int nb_temp = 0 ;

symbol symbols[MAX] ; 



void add_var(char* name) {
    symbol* var = malloc(sizeof(symbol));
    var->name = strdup(name) ;
    var->address = current_address ;
    current_address ++ ;
    var->type = 1;
    var->init = 0;
    var->depth = current_depth;
    symbols[var->address] = *var;
}



void add_const(char* name) {
    symbol* var = malloc(sizeof(symbol));
    var->name = strdup(name) ;
    var->address = current_address ;
    current_address ++ ;
    var->type = 0;
    var->init = 1;
    var->depth = current_depth;
    symbols[var->address] = *var;
}


int add_temp(){
    nb_temp += 1 ;
    symbol* var = malloc(sizeof(symbol));
    var->name = strdup("temp") ;
    var->address =  MAX - nb_temp ;
    symbols[var->address] = *var;
    return var->address ;

}


void increase_depth(){
    current_depth += 1 ;
}


void decrease_depth(){
    current_depth -= 1 ;
}


int get_depth(){
    return current_depth ;
}


int find_symbol_address(char* name){
    int i = 0 ;
    int result = -1 ;
    while(i < MAX && (strcmp(symbols[i].name,name) != 0))  i++;
    if(i!= MAX) result = symbols[i].address;
    return result ;
}


void free_temp(){
    /* while(nb_temp>0){
        free(&symbols[MAX-nb_temp]);
        nb_temp-- ;
    }
    */
    nb_temp = 0;
}


void reset_depth(){
    current_depth = 0 ;
}


void print_table(){
    int i = 0 ;
    printf(" ############# S Y M B O L S ############# \n");
    while(i < MAX){
        printf("# Nom : %s\t address : %d\t type : %d\t init : %d #\n", symbols[i].name, symbols[i].address, symbols[i].type,  symbols[i].init);
        i++;
    }
    printf(" ########################################### ");


}
