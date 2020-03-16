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
			format = "val = 0x%X\n";
			break;
		case OCT:
			format = "val = O%o\n";
			break;
		case UNSIGNED:
			format = "val = u%u\n";
			break;
		case SIGNED:
			format = "val = s%d\n";
			break;

	}

	printf(format, val);
}
