#include <stdio.h>
#include <string.h>

int 
main()
{
	char *str = "d*ee,kX`-f,";
	int len = strlen(str);

	for( int i = 0; i < len; i++)
	{
		char x = ( *(str + i) + 7 );
		printf("%c", x);
	}
	puts("");

	return 1;
}
