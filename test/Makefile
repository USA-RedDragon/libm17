LIBNAME := libm17

CC := clang
AR := llvm-ar
TARGET := host

include ../extra/cflags/common.mk

# This can be extended in the future
ifneq ($(TARGET),)
	include ../extra/cflags/$(TARGET).mk
else
	$(error "No target specified")
endif

CFLAGS += -I../inc -L..

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

######################################
# All and Clean

.PhONY: all clean
all: $(LIBNAME)_test

clean:
	rm -f $(OBJS) $(LIBNAME)_test

######################################
# Building and linking

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

$(LIBNAME)_test: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) ../$(LIBNAME).a
