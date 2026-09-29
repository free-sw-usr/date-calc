SHELL = /bin/sh
CC ?= gcc
CFLAGS = -O0 -g3 -std=c11
CPPFLAGS := $(shell pkg-config --cflags gtk+-3.0)
LDFLAGS =
LDLIBS := $(shell pkg-config --libs gtk+-3.0)

SOURCES := main.c
OBJECTS := $(SOURCES:%.c=%.o)
TARGET := date-calc

DESTDIR =
PREFIX ?= /usr
BINDIR := $(PREFIX)/bin
DESKTOPDIR := $(PREFIX)/share/applications

all: $(TARGET)

%.o: %.c
	$(CC) $(CPPFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ $(LDLIBS) -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)

install:
	install -Dm 755 $(TARGET) $(BINDIR)
	install -Dm 644 $(TARGET).desktop $(DESKTOPDIR)
uninstall:
	rm -f $(BINDIR)/$(TARGET)
	rm -f $(DESKTOPDIR)/$(TARGET).desktop

.PHONY: all clean install uninstall
