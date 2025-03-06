OUTPUT_DIR = ../build
OUTPUT = $(OUTPUT_DIR)/main

CC = gcc
CFLAGS = -std=c11 -Wall -Werror -Wextra
SRC = main.c

all: build

clang-format:
	@echo "\n\033[0;34mmake clang-format\033[0m"
	find . -type f \( -name "*.c" -o -name "*.h" \) -exec clang-format -style=file -n {} +

cppcheck:
	@echo "\n\033[0;34mmake cppcheck\033[0m"
	cppcheck --enable=all --suppress=missingIncludeSystem ./

build: $(SRC)
	@echo "\n\033[0;34mmake build\033[0m"
	mkdir -p $(OUTPUT_DIR)
	$(CC) $(CFLAGS) -o $(OUTPUT) $^ -lm

run:
	@echo "\n\033[0;34mmake run (using valgrind):\033[0m"
	valgrind --tool=memcheck --leak-check=yes $(OUTPUT)

clean:
	@echo "\n\033[0;34mmake clean:\033[0m"
	rm -rf $(OUTPUT_DIR)

.PHONY: all clean run build cppcheck clang-format
