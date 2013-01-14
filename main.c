#include<stdio.h>

static int
_add( int x, int y )
{
    return x + y;
}

int
main(void)
{
    int _x = 0;
    int _y = 1;

    _x = 2;
    _y = 3;

    _add( _x, _y );

    return 0;
}
