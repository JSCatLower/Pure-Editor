CXX = g++
CXXFLAGS = -std=c++17 -fPIC -Wall -Wextra

SOURCES = src/*.cpp

HEADERS = src/*.h

OBJECTS = $(SOURCES:.cpp=.o)


QT6_INC = $(shell pkg-config --cflags Qt6Core Qt6Widgets Qt6WebEngineWidgets 2>/dev/null)

QT6_LIBS = $(shell pkg-config --libs Qt6Core Qt6Widgets Qt6WebEngineWidgets 2>/dev/null)

SCINTILLA_INC = -I/usr/include/qt6/Qsci
SCINTILLA_LIB = -lqscintilla2_qt6

TARGET = pureeditor

all: $(TARGET)

$(TARGET): $(OBJECTS) 
	$(CXX) -o $@ $^ $(QT6_LIBS) $(SCINTILLA_LIB) -fPIC

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(QT6_INC) $(SCINTILLA_INC) -c $< -o $@

clean:
	rm -f $(TARGET)

.PHONY: all clean
