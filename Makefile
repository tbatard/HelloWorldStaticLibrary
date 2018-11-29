# Directories
BUILD_DIR=build
OBJ_DIR=$(BUILD_DIR)/obj
LIB_DIR=$(BUILD_DIR)/lib

# Commands
MKDIR	= mkdir -p
RM		= rm -rf

# Compiler
CC		= cc
CFLAGS	= -c
AR		= ar

all: build

build: lib

lib: hello-world-c
	@$(MKDIR) $(LIB_DIR)
	$(AR) rc $(LIB_DIR)/hello.a $(OBJ_DIR)/hello.o

hello-world-c: hello.c
	@$(MKDIR) $(OBJ_DIR)
	$(CC) $(CFLAGS) -o $(OBJ_DIR)/hello.o hello.c

clean:
	$(RM) $(BUILD_DIR)