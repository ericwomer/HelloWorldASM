#https://makefiletutorial.com/
TARGET_EXECUTABLE := helloc

BUILD_DIR :=./build
SRC_DIR :=./src

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

ASM := nasm
ASM_FLAGS := -f elf64 -g -O0 $(INC_FLAGS)

LINKER := mold
LINKER_FLAGS := -m elf_x86_64 --as-needed -dynamic-linker /lib64/ld-linux-x86-64.so.2 -pie -z now -z relro -o helloc /usr/lib/gcc/x86_64-linux-gnu/13/../../../x86_64-linux-gnu/Scrt1.o /usr/lib/gcc/x86_64-linux-gnu/13/../../../x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/13/crtbeginS.o -L/usr/lib/gcc/x86_64-linux-gnu/13 -L/usr/lib/gcc/x86_64-linux-gnu/13/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/13/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/13/../../..-lgcc --push-state --as-needed -lgcc_s --pop-state -lc -lgcc --push-state --as-needed -lgcc_s --pop-state /usr/lib/gcc/x86_64-linux-gnu/13/crtendS.o /usr/lib/gcc/x86_64-linux-gnu/13/../../../x86_64-linux-gnu/crtn.o

$(BUILD_DIR)/$(TARGET_EXECUTABLE): $(OBJECTS) 
	$(LINKER) $(LINKER_FLAGS) $(OBJECTS) -o $@
 
$(BUILD_DIR)/%.asm.o: %.asm
	mkdir -p $(dir $@)
	$(ASM) $(ASM_FLAGS) $< -o $@ 

.PHONY: clean
clean:
	rm -vf $(OBJECTS) $(BUILD_DIR)/$(TARGET_EXECUTABLE) 

realclean:
	rm -rf $(BUILD_DIR)

