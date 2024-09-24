ASM := nasm
LINKER := mold
ASM_FLAGS := -f elf32 -g
LINKER_FLAGS := -m elf_i386

OBJECTS := helloworld.o 

all: $(OBJECTS)
	$(LINKER) $(LINKER_FLAGS) $(OBJECTS) -o helloworld
helloworld.o:
	$(ASM) $(ASM_FLAGS) ../src/helloworld.asm -o helloworld.o 
clean:
	rm -rfv build
	rm -vf helloworld helloworld.o
