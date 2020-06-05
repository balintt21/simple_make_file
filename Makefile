CC = g++
CC_FLAGS = -O3 -Wall
LD_FLAGS =
NAME = myprogram
SOURCE_DIR = ./src
SOURCE_FILES = $(shell find -L $(SOURCE_DIR) -xtype f,l -iregex '.*\.\(c\|i\|ii\|cc\|cp\|cxx\|cpp\|CPP\|c++\|C\|s\|S\|sx\)' )
OUTPUT_DIR = ./output
INSTALL_DIR = /usr/local/bin

all: $(OUTPUT_DIR) $(SOURCE_FILES) 
	$(CC) $(CC_FLAGS) $(SOURCE_FILES) -o "$(OUTPUT_DIR)/$(NAME)" $(LD_FLAGS)
	
.PHONY: majom
majom: all
	echo "There is no such thing as "MakiMajom" because lemurs and monkeys are distinct mammals!

.PHONY: install
install: all
	cp $(OUTPUT_DIR)/$(NAME) $(INSTALL_DIR)/$(NAME)

.PHONY: clean
clean: 
	rm -rf $(OUTPUT_DIR)
	
.PHONY: uninstall
uninstall:
	rm -rf $(INSTALL_DIR)/$(NAME)

$(OUTPUT_DIR):
	mkdir $(OUTPUT_DIR)
