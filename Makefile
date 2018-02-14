CC=gcc
COFLAGS=
CWFLAGS=
CIFLAGS=
CMFLAGS=
CFLAGS= $(CWFLAGS) $(COFLAGS) $(CIFLAGS) $(CMFLAGS)

all: lex.yy.o
	gcc lex.yy.o

#beautify: beautify.o symbol.o init.o
	#$(CC) $(CFLAGS) -obeautify $<

.c.o:
	$(CC) $(CFLAGS) -c $<

lex.yy.c: beautify.lex
	flex beautify.lex

.PHONY: clean

clean:
	rm -rf *.o
	rm -rf *.out
	rm *.yy.c
