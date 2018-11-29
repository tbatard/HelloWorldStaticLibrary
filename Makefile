# Directories
SRC_DIR 		= src
LINUX_SRC_DIR 	= $(SRC_DIR)/linux
MACOS_SRC_DIR 	= $(SRC_DIR)/macos
BUILD_DIR 		= build
OBJ_DIR			= $(BUILD_DIR)/obj
LIB_DIR			= $(BUILD_DIR)/lib

# Common source files
SRC := $(wildcard $(SRC_DIR)/*.c)

# Compiler
CFLAGS	= -c
AR		= ar

OS = $(shell sh -c 'uname 2>/dev/null || echo Unknown')

ifeq ($(OS),Linux)
	CC = gcc
	SRC += $(wildcard $(LINUX_SRC_DIR)/*.c)
endif

ifeq ($(OS),Darwin)
	SRC += $(wildcard $(MACOS_SRC_DIR)/*.c)
	CC = clang
endif

# Object files
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Commands
MKDIR	= mkdir -p
RM		= rm -rf

all: build

build: lib

lib: $(OBJ)
	@$(MKDIR) $(LIB_DIR)
	$(AR) rc $(LIB_DIR)/hello.a $(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(BUILD_DIR)