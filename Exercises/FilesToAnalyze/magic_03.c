/* password: "6ELD*2\b:40d$T 4d3" */
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#define STDIN 0


char *trap = "D0y0uth1nk1t5th4t345y?";
int trap_len = 27;
char *lol = "ru5t_F4ST_4nd_54f3";

void
_x1(char* s) {
	size_t len = strlen(s) / 2;
	
	for(int i = 0; i <= len; i++) {
		s[i] = (s[i] ^ trap[i % trap_len]);
	}
}

void
_x2(char* s) {
	size_t len = strlen(s);
	size_t start = len / 2 + 1;
	
	for(int i = start; i < len; i++) {
		s[i] = (s[i] & trap[i % trap_len]);
	}
}

int
_n(char* lhs, char* rhs)
{
	_x1(rhs);
	_x2(rhs);

	for(int i = 0; i < 18; i++) {
		if(lhs[i] != rhs[i]) return 0;
	}

	return 1;
}

int
main(int argc, char **argv)
{
	char password[32] = {0};
	char buffer[32] = {0};
	int 	count;

	printf("Please enter your password: ");
	fflush(stdout);

	count = read( STDIN, password, 31 );
	password[count - 1] = '\0';

	strncpy(buffer, lol, 32);
	
	if(_n(password, buffer)) {
		printf("SUCCESS!\n");
		printf("HTW2020{%s}\n", password);
	} else {
		printf("NOPE, TRY HARDER!\n");
	}
	return 0;
}

