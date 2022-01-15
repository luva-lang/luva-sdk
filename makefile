SRC_DIR		:= src
INC_DIR		:= inc
OBJ_DIR		:= obj
BIN_DIR		:= bin

BIN_NAME	:= luva.std.so

TARGET		:= $(BIN_DIR)/$(BIN_NAME)

SOURCES		:= $(wildcard $(SRC_DIR)/*.lv $(SRC_DIR)/*/*.lv)

CC			:= lvc
LVC_FLAGS	:= -S -shared

MOUDLE_DIR	:= /usr/lib/luva/std

# ------------------------------------

all: build

build: dirs $(TARGET)

rebuild: clean build

dirs:
	@mkdir -p $(BIN_DIR)

install: build
	mkdir -p $(MOUDLE_DIR)
	cp $(TARGET) $(MOUDLE_DIR)/$(BIN_NAME)
	cp $(TARGET).lvh $(MOUDLE_DIR)/$(BIN_NAME).lvh

uninstall:
	rm -rf $(MOUDLE_DIR)/$(BIN_NAME)
	rm -rf $(MOUDLE_DIR)/$(BIN_NAME).lvh

$(TARGET): $(SOURCES)
	$(CC) $(LVC_FLAGS) $^ -o $@

clean:
	rm -rf $(TARGET)