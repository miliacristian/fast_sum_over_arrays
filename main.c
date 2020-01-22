
#include "main.h"
extern struct timespec timer;

#if CODE_BASIC==1
int main(){
	//initialization
	cpu_set_t cpu_set;
	int res=pin_thread_to_core(0,&cpu_set);
	if(res!=0){
		handle_error_with_exit("impossible pin thread\n");
	}
	int**matrix=generate_random_integer_matrix(NUM_ARRAYS,ARRAY_SIZE);
	//matrix[i]==row[i]
	//matrix[i][j]==element j in row[i]
	//the work cannot be parallelized with more thread
	//values TIMES,ARRAY_SIZE,NUM_ARRAYS can change, don't do overfitting on them!
	//consider ARRAY_SIZE>>NUM_ARRAYS>>TIMES
	//consider values random in matrix, no math trick are allows to calculate final sum,so any order of sums is ok,but must be present all sums

	//do work
	asm volatile("mfence");
	//we want to calculate sum of row_0+row_1+row_2+row_3+.....row_(NUM_ARRAYS-1) and store result in row_0
	gettime(&timer);
	for(int i=0;i<TIMES;i++){//this external loop cannot be modified

		//do sum over arrays
		for(int j=1;j<NUM_ARRAYS;j++){//for each array,every rows in matrix are array indexes 
			for(int h=0;h<ARRAY_SIZE;h++){//for each element of array
				matrix[0][h]+=matrix[j][h];//sum element of row0 with element of rowj
			}
		}
	}

	print_time_elapsed("time to sum over arrays CODE BASIC");
	//finalization
	free_memory_matrix_int(matrix,NUM_ARRAYS,ARRAY_SIZE);
	return 0;
}
#endif