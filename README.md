# Hello, World! Assembly Project (NASM/Linux) 
Yet Another Assembly Hello World Projcet <sup>_YAAHWP_</sup>

## i386
32bit program printing out "Hello, World!"

## x86_64
64bit program printing "Hello, 64bit!"

## libc
64bit program using libc's put method printing "Hello, C!"

## Building
All at once

`make`

Release build

`make RELEASE=1`

To build the inviducual modules just cd into the corresponding directory and runn the commands above

## Cleanup
### Default
Delete the debug blob files and executable

`make clean`

### Release
Delete the release blob files and executable

`make RELEASE=1 clean`

### _Realclean_
Will delecte the Build/ directory
`make realclean`
