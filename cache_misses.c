/* mountain.c - Generate the memory mountain. */
/* $begin mountainmain */
#include <stdlib.h>
#include <stdio.h>
#include "fcyc2.h" /* K-best measurement timing routines */
#include "clock.h" /* routines to access the cycle counter */

#define MINBYTES (1 << 14)  /* Working set size ranges from 16 KB */
#define MAXBYTES (1 << 28)  /* ... up to 256 MB */
#define MAXSTRIDE 32        /* Strides range from 1 to 32 */
#define STRIDESTRIDE 1      /* increment stride by this amount each time */
#define MAXELEMS MAXBYTES/sizeof(int) 

int data[MAXELEMS];         /* The array we'll be traversing */

/* $end mountainmain */
void init_data(int *data, int n);
void test(int elems, int stride);
double run(int size, int stride, double Mhz);

/* $begin mountainmain */
int main(int argc, char *argv[])
{
    int size=1<<atoi(argv[1]);        /* Working set size (in bytes) */
    int stride=atoi(argv[2]);      /* Stride (in array elements) */
    double Mhz;      /* Clock frequency */

    init_data(data, MAXELEMS); /* Initialize each element in data to 1 */
    //Mhz = mhz(1);              /* Estimate the clock frequency */
    run(size, stride, 2000.2);
    exit(0);
}
/* $end mountainmain */

/* init_data - initializes the array */
void init_data(int *data, int n)
{
    int i;

    for (i = 0; i < n; i++)
	data[i] = 1;
}

/* $begin mountainfuns */
void test(int elems, int stride) /* The test function */
{
    int i, result = 0; 
    volatile int sink; 

    for (i = 0; i < elems; i += stride)
	result += data[i];
    sink = result; /* So compiler doesn't optimize away the loop */
}

/* Run test(elems, stride) and return read throughput (MB/s) */
double run(int size, int stride, double Mhz)
{
    double cycles;
    int elems = size / sizeof(int); 

    test(elems, stride);                     /* warm up the cache */
    cycles = fcyc2(test, elems, stride, 0);  /* call test(elems,stride) */
    return (size / stride) / (cycles / Mhz); /* convert cycles to MB/s */
}
/* $end mountainfuns */


