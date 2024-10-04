#https://makefiletutorial.com/
TARGET_EXECUTABLE := hellolibrary

BUILD_DIR := ./Build

SRC_DIR := ./src
DEPS_DIR := ./lib

REALCLEAN_DIR := $(BUILD_DIR)

BUNDLED_LIBRARIES := print

ifeq ($(RELEASE), 1)
	LIBRARIES += $(BUNDLED_LIBRARIES:%=-l%)
	BUILD_DIR := $(BUILD_DIR)/Release
	ASM_FLAGS := -W+all -f elf64 -Ox $(INC_FLAGS)
else
	TARGET_EXECUTABLE := $(addprefix $(TARGET_EXECUTABLE),_dbg)
	_LIBRARIES := $(addprefix $(BUNDLED_LIBRARIES),_dbg)
	LIBRARIES += $(_LIBRARIES:%=-l%)
	BUILD_DIR := $(BUILD_DIR)/Debug
	ASM_FLAGS := -W+all -f elf64 -g -O0 $(INC_FLAGS)
endif

LIB_DIR := $(BUILD_DIR)/lib

BUNDLED_LIBRARY_PATH := -L$(LIB_DIR) -rpath='$$ORIGIN/lib'

SYSTEM_LIBRARIES :=
SYSTEM_LIBRARY_PATH :=

ifneq ($(SYSTEM_LIBRARIES),)
	LIBRARIES := $(SYSTEM_LIBRARIES:%=-l%)
endif

ASM := nasm

# If linking with GCC makes you feel more comfortable
# LINKER := gcc
# LINKER_FLAGS := -no-pie -nostartfiles $(LIBRARY_PATH) $(LIBRARIES) $(BUNDLED_LIBRARY_PATH)

# With mold instead of ld or gcc
# LINKER := mold

LINKER := ld 
LINKER_FLAGS := -m elf_x86_64 -no-pie -dynamic-linker /lib64/ld-linux-x86-64.so.2 $(LIBRARY_PATH) $(LIBRARIES) $(BUNDLED_LIBRARY_PATH)

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

.PHONY: all $(DEPS_DIR)
all: $(DEPS_DIR) $(BUILD_DIR)/$(TARGET_EXECUTABLE)

$(DEPS_DIR): 
	mkdir -p $(LIB_DIR)
	$(MAKE) -C $@

$(BUILD_DIR)/$(TARGET_EXECUTABLE): $(OBJECTS)
	$(LINKER) $(LINKER_FLAGS) $(OBJECTS) -o $@
 
$(BUILD_DIR)/%.asm.o: %.asm 
	mkdir -p $(dir $@)
	$(ASM) $(ASM_FLAGS) $< -o $@ 

.PHONY: clean
clean:
	rm -vf $(OBJECTS) $(BUILD_DIR)/$(TARGET_EXECUTABLE)
	$(MAKE) -C $(DEPS_DIR) clean

.PHONY: realclean
realclean:
	rm -rf $(REALCLEAN_DIR)
	$(MAKE) -C $(DEPS_DIR) realclean

