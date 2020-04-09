#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define STDIN 0

void magic(char *str, int len);
void encrypt(char *str, int len);
int validate(char *lhs, char *rhs);
void x_validate(char *lhs);

char s[] = {"\x4c\x4f\x57\x2b\x2c\x29\x28\x70\x27\x3f\x36\x50\x39\x23\x2f\x1e\x27\x68\0"};

int
main(int argc, char **argv)
{
	char 	password[32];
	int 	count;
	char 	pw[64] = "ELF_M4G1C\0";
	char 	flag[64] = "HTW2020{3LF_M4G1C}\0";

	printf("Please enter your password: ");
	fflush(stdout);

	count = read( STDIN, password, 31 );
	password[count - 1] = '\0';

	if( validate(password, "d*ee,kX`-f,") )
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

int 
validate(char *lhs, char *rhs)
{
	int len = strlen(lhs);
	int len2 = strlen(rhs);

	if( len != len2 ) return 0;

	for( int i = 0; i < len; i++)
	{
		char x = ( *(lhs + i) - 7 );

		if( x != *( rhs + i ) ) return 0;
	}

	return 1;
}

void
x_validate(char *lhs)
{
	for( int i = 0; i < strlen(lhs); i++) printf("%c", *(lhs + i) - 7);
	puts("");
}

void
magic(char *str, int len)
{
	for( int i = 0; i < len; i++)
	{

		if( !( i & 0x1) )
		{
			*(str + i) = *(str + i) + ( i << 1 ) - 4;
		}
		else
		{
			*(str + i) = *(str + i) + i + 4;

		}
	}
}


void
encrypt(char *str, int len)
{
	for( int i = 0; i < len; i++)
	{
		if( !( i & 0x1) )
		{
			*(str + i) = *(str + i) - ( i << 1 ) + 4;
		}
		else
		{
			*(str + i) = *(str + i) - i - 4;

		}
	}
}

