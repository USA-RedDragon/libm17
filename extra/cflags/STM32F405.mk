# Architecture-specific flags
CFLAGS += -target arm-none-eabi -mthumb -mcpu=cortex-m4 -mfloat-abi=hard \
          -mfpu=fpv4-sp-d16 -mlittle-endian -fshort-wchar -mno-unaligned-access
