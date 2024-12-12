ifneq ($(KERNELRELEASE),)
# Kbuild integration
obj-m := hello1.o hello2.o
ccflags-y := -I$(src)/inc
else
# Standalone Makefile
KDIR ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
endif

