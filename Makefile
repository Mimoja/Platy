TARGET = platy

CC     = cc
CPP    = c++
CPPFLAGS = -pthread -O2 --std=c++11 -Wextra -Wpedantic -g

EXTRA_DEFINES  = -DLINUX -DGLM_FORCE_RADIANS -DPROG_NAME=\"$(TARGET)\"
LFLAGS       = $(LIB_LINUX) -lXrandr -lGL -lXi -pthread -lm -lX11 -lXxf86vm -lGLEW -lglfw -lassimp   -lsfml-graphics -lsfml-window -lsfml-system

OBJECTS = $(patsubst %.cpp, %.o, $(wildcard src/*.cpp))

$(TARGET): $(OBJECTS)
	$(CPP) $(OBJECTS) $(LFLAGS) -o $(TARGET)

%.o: %.cpp
	$(CPP) $(CPPFLAGS) $(EXTRA_DEFINES) -c $^ -o $@

clean:
	rm -f *.o
	rm -f $(TARGET)
