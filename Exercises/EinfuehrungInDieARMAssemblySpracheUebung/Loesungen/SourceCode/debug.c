#include <stdio.h>

enum FUNCTIONS {
    HEX,
    OCT,
    UNSIGNED,
    SIGNED
};

void 
info(const int func, const int val)
{
	char *format;

	switch(func) {
		case HEX:
			format = "0x%X\n";
			break;
		case OCT:
			format = "O%o\n";
			break;
		case UNSIGNED:
			format = "%u\n";
			break;
		case SIGNED:
			format = "%d\n";
			break;

	}

	printf(format, val);
}
