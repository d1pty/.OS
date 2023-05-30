.PHONY: clean run asm

OBJS=hello.o fact.o
# CFLAGS=-O2 -g3
CFLAGS=-O3 -g3

run: hello
	./$<

hello: $(OBJS)
	gcc $(CFLAGS) -o hello $(OBJS)

%.o : %.c
	gcc $(CFLAGS) -c -o $@ $<

# hello.c: fact.h
# fact.c: fact.h
	
clean:
	rm -f hello *.o *~ *.a
asm: 
	gcc -c -S -o fact.s fact.c
	gcc -c -S -o hello.s hello.c
