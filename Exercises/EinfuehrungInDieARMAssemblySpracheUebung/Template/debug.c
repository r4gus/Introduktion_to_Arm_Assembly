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
			format = "val = %X\n";
			break;
		case OCT:
			format = "val = %o\n";
			break;
		case UNSIGNED:
			format = "val = %u\n";
			break;
		case SIGNED:
			format = "val = %d\n";
			break;

	}

	printf(format, val);
}
