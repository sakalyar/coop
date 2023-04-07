CC = gcc
CFLAGS = -std=c11 \
  -Wall -Wconversion -Werror -Wextra -Wfatal-errors -Wpedantic -Wwrite-strings \
  -O2 -c
LDFLAGS = 
objects = main.o
executable= main

all: $(executable)

clean:
	$(RM) $(executable)

$(executable): $(objects)
	$(CC) $(objects) $(LDFLAGS) -o $(executable)

main.o: main.c
