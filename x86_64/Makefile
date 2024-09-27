# https://makefiletutorial.com/
TARGET_EXECUTABLE := helloworld.x86_64

BUILD_DIR :=./build
SRC_DIR :=./src

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

ASM := nasm
ASM_FLAGS := -f elf64 -g -O0 $(INC_FLAGS)

LINKER := mold
LINKER_FLAGS := -m elf_x86_64

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
