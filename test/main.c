// This file functions as the test entrypoint for libm17.

#include <m17.h>

#include "assert.h"
#include <stdio.h>

int main()
{
    int pass_counter = 0;
    int fail_counter = 0;

    ASSERT("Dummy func always returns 1", m17_dummyfunc() != 1, pass_counter, fail_counter);

    int total_tests = pass_counter + fail_counter;

    printf("%d Tests Completed: %d Passed, %d Failed.\n", total_tests, pass_counter, fail_counter);

    return fail_counter;
}
