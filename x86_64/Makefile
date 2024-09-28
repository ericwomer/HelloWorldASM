#https://makefiletutorial.com/
TARGET_EXECUTABLE := helloworld.x86_64
BUILD_DIR := ./Build
SRC_DIR := ./src
REALCLEAN_DIR := $(BUILD_DIR)

ifeq ($(RELEASE), 1)
	BUILD_DIR := $(BUILD_DIR)/Release
	ASM_FLAGS := -W+all -f elf64 -Ox $(INC_FLAGS)
else
	TARGET_EXECUTABLE := $(addprefix $(TARGET_EXECUTABLE),_dbg)	
	BUILD_DIR := $(BUILD_DIR)/Debug
	ASM_FLAGS := -W+all -f elf64 -g -O0 $(INC_FLAGS)
endif

ASM := nasm

LINKER := mold
LINKER_FLAGS := -m elf_x86_64 -no-pie $(LIBRARY_PATH) $(LIBRARIES)

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

LIBRARIES :=
LIBRARY_PATH :=

$(BUILD_DIR)/$(TARGET_EXECUTABLE): $(OBJECTS) 
	$(LINKER) $(LINKER_FLAGS) $(OBJECTS) -o $@
 
$(BUILD_DIR)/%.asm.o: %.asm
	mkdir -p $(dir $@)
	$(ASM) $(ASM_FLAGS) $< -o $@ 

.PHONY: clean
clean:
	rm -vf $(OBJECTS) $(BUILD_DIR)/$(TARGET_EXECUTABLE) 

realclean:
	rm -rf $(REALCLEAN_DIR)

