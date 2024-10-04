#https://makefiletutorial.com/
TARGET := libprint

BUILD_DIR := ../../Build
SRC_DIR := ./src

DIST_DIR :=

REALCLEAN_DIR := $(BUILD_DIR)

ifeq ($(RELEASE), 1)
	TARGET_SHARED_LIBRARY := $(TARGET)
	TARGET_STATIC_LIBRARY := $(TARGET)
	BUILD_DIR := $(BUILD_DIR)/Release
	ASM_FLAGS := -W+all -f elf64 -Ox $(INC_FLAGS)
else
	TARGET_SHARED_LIBRARY := $(addprefix $(TARGET),_dbg)
	TARGET_STATIC_LIBRARY := $(addprefix $(TARGET),_dbg)
	BUILD_DIR := $(BUILD_DIR)/Debug
	ASM_FLAGS := -W+all -f elf64 -gdwarf -O0 $(INC_FLAGS)
endif

# Move this down here so we get lib**_dbg.so and lib**_dbg.a
TARGET_SHARED_LIBRARY := $(addprefix $(TARGET_SHARED_LIBRARY),.so)
TARGET_STATIC_LIBRARY := $(addprefix $(TARGET_STATIC_LIBRARY),.a)

DIST_DIR := $(BUILD_DIR)/lib

ASM := nasm
LINKER := ld
AR := ar

LIBRARIES :=
LIBRARY_PATH :=

LINKER_FLAGS := -m elf_x86_64 -no-pie -shared $(LIBRARY_PATH) $(LIBRARIES)

AR_FLAGS = rcs

SRCS := $(shell find $(SRC_DIR) -iname '*.asm')
OBJECTS := $(SRCS:%=$(BUILD_DIR)/%.o)

INC_DIR := $(shell find $(SRC_DIR) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIR))

.PHONY: all
all: $(BUILD_DIR)/$(TARGET_SHARED_LIBRARY) $(BUILD_DIR)/$(TARGET_STATIC_LIBRARY)

$(BUILD_DIR)/$(TARGET_SHARED_LIBRARY): $(OBJECTS) 
	$(LINKER) $(LINKER_FLAGS) $(OBJECTS) -o $(DIST_DIR)/$(TARGET_SHARED_LIBRARY) 

$(BUILD_DIR)/$(TARGET_STATIC_LIBRARY): $(OBJECTS)
	$(AR) $(AR_FLAGS) $(DIST_DIR)/$(TARGET_STATIC_LIBRARY) $(OBJECTS) 

$(BUILD_DIR)/%.asm.o: %.asm
	mkdir -p $(dir $@)
	$(ASM) $(ASM_FLAGS) $< -o $@ 

.PHONY: clean
clean:
	rm -vf $(OBJECTS) $(DIST_DIR)/$(TARGET_SHARED_LIBRARY) $(DIST_DIR)/$(TARGET_STATIC_LIBRARY) 

.PHONY: realclean
realclean:
	rm -rf $(REALCLEAN_DIR)

