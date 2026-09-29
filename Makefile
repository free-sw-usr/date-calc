CC = gcc
CFLAGS = -O0 -g3 -std=c11 -I./src $(shell pkg-config --cflags gtk+-3.0)
LDFLAGS = $(shell pkg-config --libs gtk+-3.0)

SOURCES = main.c
OBJECTS = $(SOURCES:%.c=%.o)
TARGET = date-calc

all: $(TARGET)

%.o: %.c
	$(CC) $(CPPFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) $< $(LDFLAGS) -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

install:
	install -Dm 755 $(TARGET) $(BINDIR)
	install -Dm 644 $(TARGET).desktop $(DESKTOPDIR)

.PHONY: all clean install
