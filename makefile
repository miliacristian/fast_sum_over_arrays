CC = gcc
CFILES=$(shell ls *.c)
PROGS=$(CFILES:%.c=%)

#compiler version
CFLAGS =-Wall -Wextra

ifdef OPTIMIZATION_LEVEL
CFLAGS:= $(CFLAGS) -o$(OPTIMIZATION_LEVEL)
else
CFLAGS:= $(CFLAGS) -o0 #no optimization
endif

ifdef CUSTOM_MALLOC
CFLAGS:= $(CFLAGS) -DCUSTOM_MALLOC=1	
CFLAGS:= $(CFLAGS) -Xlinker --wrap=malloc -Xlinker --wrap=free
endif


#code version
ifdef DEBUG
CFLAGS:= $(CFLAGS) -DDEBUG=$(DEBUG)
else
CFLAGS:= $(CFLAGS) -DDEBUG=0
endif

ifdef CODE_BASIC
CFLAGS:= $(CFLAGS) -DCODE_BASIC=$(CODE_BASIC)
else
CFLAGS:= $(CFLAGS) -DCODE_BASIC=0
endif

ifdef LOCK_MEMORY
CFLAGS:= $(CFLAGS) -DLOCK_MEMORY=$(LOCK_MEMORY)
else
CFLAGS:= $(CFLAGS) -DLOCK_MEMORY=0
endif

CFLAGS:= $(CFLAGS) -DCACHE_LINE_SIZE=$(shell getconf LEVEL1_DCACHE_LINESIZE)
install:sum_over_arrays_basic

sum_over_arrays_basic:$(CFILES)
		$(CC) $(CFLAGS) -o $@ $^ -lm -lrt -pthread

sum_over_arrays_clean:
	rm sum_over_arrays_basic

clean:
	make sum_over_arrays_clean

clean_all:
	make sum_over_arrays_clean