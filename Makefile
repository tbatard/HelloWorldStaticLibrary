# Directories
SRC_DIR 	= src
BUILD_DIR 	= build
OBJ_DIR		= $(BUILD_DIR)/obj
LIB_DIR		= $(BUILD_DIR)/lib

# Commands
MKDIR	= mkdir -p
RM		= rm -rf

# Compiler
CC		= cc
CFLAGS	= -c
AR		= ar

# Files
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

all: build

build: lib

lib: $(OBJ)
	@$(MKDIR) $(LIB_DIR)
	$(AR) rc $(LIB_DIR)/hello.a $(OBJ_DIR)/hello.o

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(MKDIR) $(OBJ_DIR)
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) $(BUILD_DIR)