CC=g++
COFLAGS=
CWFLAGS=
CIFLAGS=-I.
CMFLAGS=
CFLAGS= $(CWFLAGS) $(COFLAGS) $(CIFLAGS) $(CMFLAGS)

all: beautify.out

beautify.out: lex.yy.o
	$(CC) $(CFLAGS) -o $@ lex.yy.o

lex.yy.o: lex.yy.c beautify.h cbeautify.h
	$(CC) $(CFLAGS) -c $<

lex.yy.c: beautify.lex
	flex beautify.lex


.PHONY: clean

clean:
	rm -rf *.o
	rm -rf *.out
	rm -rf *.yy.c
