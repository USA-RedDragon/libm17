# Compile-time Optimization
CFLAGS += -Ofast
# Link-time Optimization
CFLAGS += -fuse-ld=lld
# Warnings
CFLAGS += -Wall -Werror
# Disabled warnings
CFLAGS += -Wno-unused-command-line-argument
