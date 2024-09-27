# https://makefiletutorial.com/
TARGET_EXECUTABLE := helloworld

BUILD_DIR :=./build
SRC_DIR :=./src

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

ASM := nasm
ASM_FLAGS := -f elf32 -g -O0 $(INC_FLAGS)

LINKER := mold
LINKER_FLAGS := -m elf_i386

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
