CC = g++
CC_FLAGS = -O3 -Wall
LD_FLAGS =
NAME = myprogram
SOURCE_DIR = ./src
SOURCE_FILES = $(shell find $(SOURCE_DIR) -type f -name '*.cpp' )
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
