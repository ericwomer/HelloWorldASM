BUILD_DIR := ./build

SUB_PROJECTS := i386 x86_64 

all: $(SUB_PROJECTS)
	mkdir -p $(BUILD_DIR)

$(SUB_PROJECTS):
	cd $@ && $(MAKE)
