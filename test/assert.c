#include "assert.h"
#include <stdio.h>

void assert_fail(char* desc, char* expr) {
    printf("[FAIL] %s:\n", desc);
    printf("\tExpression was expected to be true: %s\n\n", expr);
}
