// This file functions as the test entrypoint for libm17.

#ifndef __ASSERT_H__
#define __ASSERT_H__

void assert_fail(char* desc, char* expr);

#define ASSERT(desc, expr, pass_counter, fail_counter)                                                                 \
    if (!(expr)) {                                                                                                     \
        assert_fail(desc, #expr);                                                                                      \
        fail_counter++;                                                                                                \
    } else                                                                                                             \
        pass_counter++;

#endif // __ASSERT_H__
