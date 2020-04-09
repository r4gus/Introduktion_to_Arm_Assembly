#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define STDIN 0

void magic(char *str, int len);
void encrypt(char *str, int len);

char s[] = {"\x48\x53\x53\x2f\x28\x2d\x24\x74\x54\x27\x5a\x69\x47\x6a\x14\x63\x52\x20\x3b\x1e\x4c\x4a\x4b\x1a\x3c\x53\x2b\x4c\xfb\x57\x23\x49\xf4\x51\x20\x10\x2a\x58"};

int
main(int argc, char **argv)
{
	char 	password[32];
	int 	count;

	printf("Please enter your password: ");
	fflush(stdout);

	count = read( STDIN, password, 31 );
	password[count - 1] = '\0';



	if( strcmp( password, "h4rd_c0d3d_i5_b4d") == 0 )
	{
		magic(s, strlen(s));
		puts(s);
	}
	else
	{
		printf("That's not the password.\n");
	}

	return 0;
}

void
magic(char *str, int len)
{
	for( int i = 0; i < len; i++)
	{

		if( !( i & 0x1) )
		{
			*(str + i) = *(str + i) + ( i << 1 );
		}
		else
		{
			*(str + i) = *(str + i) + i;

		}
	}
}

