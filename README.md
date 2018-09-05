# simple_make_file
Simple make file for building small gcc projects

Compiles every source file from SOURCE_DIR recursively and makes an executable to OUTPUT_DIR with the given NAME

    CC = g++
    CC_FLAGS = -O3 -Wall
    LD_FLAGS =
    NAME = myprogram
    SOURCE_DIR = ./src
    SOURCE_FILES = $(shell find $(SOURCE_DIR) -type f -iregex '.*\.\(c\|i\|ii\|cc\|cp\|cxx\|cpp\|CPP\|c++\|C\|s\|S\|sx\)' )
    OUTPUT_DIR = ./output

    all: $(OUTPUT_DIR) $(SOURCE_FILES) 
        $(CC) $(CC_FLAGS) $(SOURCE_FILES) -o "$(OUTPUT_DIR)/$(NAME)" $(LD_FLAGS)

    .PHONY: install
    install: all
        cp $(OUTPUT_DIR)/$(NAME) /usr/bin/$(NAME)

    .PHONY: clean
    clean: 
        rm -r $(OUTPUT_DIR)

    $(OUTPUT_DIR):
        mkdir $(OUTPUT_DIR)
