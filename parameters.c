#include "parameters.h"

void check_variable_in_defines(){
	if(TIMES<=0){
		handle_error_with_exit("invalid parameter TIMES\n");
	}
	if (ARRAY_SIZE<=0){
		handle_error_with_exit("invalid parameter ARRAY_SIZE\n");
	}
	if(NUM_ARRAYS<=0){
		handle_error_with_exit("invalid parameter NUM_ARRAYS\n");
	}
    return;
}