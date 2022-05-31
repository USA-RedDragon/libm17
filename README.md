# libm17

A set of functions in pure C to create M17 protocol frames.

## Status

v0.0.0000000001 - Super early draft, probably not fully implemented or implemented inaccurately. Do not use.

## Compiling

By default, this project will compile for the host OS. To build for an alternative target set the `TARGET` variable with `make TARGET=DESIRED_TARGET`, where `DESIRED_TARGET` is one of the supported targets.

### Supported Targets

- `host` - The OS you're currently on
- `STM32F405` - ST Microelectronics MCU found in the Tytera MD-380 and similar.

## Notable `make` Targets

- `all` - Creates `libm17` as a static library.
- `ci` - Compiles the library with debugging symbols, verbosely.
- `test` - Compiles the tests from the `test` folder and runs them.
- `format` - Runs `clang-format` to format the code according to the code style in `.clang-format`.
- `format-check` - Runs `clang-format` to check code for formatting issues. DOES NOT FORMAT THE FILES.
- `sca` - Rebuilds with LLVM's `scan-build` for static code analysis.
