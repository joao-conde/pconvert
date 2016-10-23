CC=gcc
CP=cp
RM=rm
SYS=posix
CFLAGS=-c -Wall -I/usr/local/include -I/usr/include/python$(PYTHON_VERSION) -I/usr/local/include/python$(PYTHON_VERSION) $(shell python-config --includes)
LDFLAGS=-L/usr/local/lib
CPFLAGS=-rf
RMFLAGS=-rf
LIBS=-lm -lpng
PREFIX=/usr
SRC_DIR=src/pconvert
SOURCES=$(SRC_DIR)/stdafx.c $(SRC_DIR)/pconvert.c $(SRC_DIR)/structs.c $(SRC_DIR)/util.c $(SRC_DIR)/opencl.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=pconvert
PYTHON_VERSION=2.7

ifeq ($(SYS),darwin)
  CC=clang
  LDFLAGS+=-framework OpenCL
endif

ifeq ($(DEBUG),1)
  CFLAGS+=-g
  LDFLAGS+=-g
endif

all: $(SOURCES) $(EXECUTABLE)

install: all
	$(CP) $(EXECUTABLE) $(PREFIX)/bin

clean:
	$(RM) $(RMFLAGS) $(OBJECTS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ $(LIBS)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@
