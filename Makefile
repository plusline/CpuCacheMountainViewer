CC = gcc
CFLAGS = -Wall 

mountain: mountain.c fcyc2.c clock.c
	$(CC) $(CFLAGS) -o mountain mountain.c fcyc2.c clock.c 

cache: cache_misses.c fcyc2.c clock.c
	$(CC) $(CFLAGS) -o cache_misses cache_misses.c fcyc2.c clock.c 

clean:
	rm -f mountain *.o *~


