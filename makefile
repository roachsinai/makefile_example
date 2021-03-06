IDIR =./include
CC=gcc

ifdef debug
	CFLAGS=-I$(IDIR) -g
else
	CFLAGS=-I$(IDIR)
endif

ODIR=obj
LDIR =./lib

LIBS=-lm

_DEPS = hellofunc.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake.out: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean
clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~
	rm -f hellomake.out

.PHONY: run
run:
	./hellomake.out
