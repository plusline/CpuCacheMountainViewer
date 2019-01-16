#include <stdlib.h>
#include <stdio.h>


inline int bitCount(int x){

        static const unsigned char BitsSetTable256[256] =
{
#   define B2(n) n,     n+1,     n+1,     n+2
#   define B4(n) B2(n), B2(n+1), B2(n+1), B2(n+2)
#   define B6(n) B4(n), B4(n+1), B4(n+1), B4(n+2)
    B6(0), B6(1), B6(1), B6(2)
};

        return BitsSetTable256[x & 0xff] +
        BitsSetTable256[(x >> 8) & 0xff] +
        BitsSetTable256[(x >> 16) & 0xff] +
        BitsSetTable256[x >> 24];

}

int main(){
    
    return 0;
}
