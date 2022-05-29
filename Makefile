CC = fasm
BUILD_DIR=./build/
SOURCE_DIR=./src/

once: $(SOURCE_DIR)main.asm
	$(CC) $(SOURCE_DIR)main.asm
	ld $(SOURCE_DIR)main.o -o $(BUILD_DIR)main

clear: 
	rm **/*.o