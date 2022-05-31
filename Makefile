LIBNAME := libm17

CC := clang
AR := llvm-ar
TARGET := host

include extra/cflags/common.mk

# This can be extended in the future
ifneq ($(TARGET),)
	include extra/cflags/$(TARGET).mk
else
	$(error "No target specified")
endif

CFLAGS += -nostdlib -Iinc

SRCS := $(wildcard src/*.c)
OBJS := $(SRCS:.c=.o)

######################################
# All and Clean

.PhONY: all clean
all: $(LIBNAME).a

clean:
	rm -f $(OBJS) $(LIBNAME).a

######################################
# Building and linking

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

$(LIBNAME).a: $(OBJS)
	$(AR) -r $@ $(OBJS)

######################################
# CI

.PHONY: ci sca format format-check test

ci: CFLAGS += -g -v
ci: clean all

sca: clean
	scan-build -analyze-headers -k -o /tmp/scan-build --use-cc=clang "${MAKE}" all

format:
	@find src -name *.c | xargs clang-format -i
	@find inc -name *.h | xargs clang-format -i
	@find test -name *.h -o -name *.c | xargs clang-format -i

format-check:
	find src -name *.c | xargs clang-format --dry-run -Werror --ferror-limit=0
	find inc -name *.h | xargs clang-format --dry-run -Werror --ferror-limit=0
	find test -name *.h -o -name *.c | xargs clang-format --dry-run -Werror --ferror-limit=0

test: clean $(LIBNAME).a
	"${MAKE}" -C test $(LIBNAME)_test
	@./test/$(LIBNAME)_test
