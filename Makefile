MODULES := i386 x86_64 libc print_library print_module
MODULES_CLEAN := $(addsuffix .clean, $(MODULES))
MODULES_REAL_CLEAN := $(addsuffix .realclean, $(MODULES))

.PHONY: all clean realclean $(MODULES) $(MODULES_CLEAN)

all: $(MODULES)

clean: $(MODULES_CLEAN)
realclean: $(MODULES_REAL_CLEAN)

$(MODULES):
	$(MAKE) -C $@;

$(MODULES_CLEAN): 
	$(MAKE) -C $(basename $@) clean;

$(MODULES_REAL_CLEAN):
	$(MAKE) -C $(basename $@) realclean

