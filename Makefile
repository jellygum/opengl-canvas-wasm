
#PROJ=main
#EXP_FUNC = calcFactorial

ifeq ($(OS),Windows_NT)
  RM=del
else
  RM=rm
endif

CC=emcc

CPPSRC=main.cpp
JS=index.js

#CFLAGS=-s WASM=1 --emrun -O3 -s ONLY_MY_CODE=1 -s EXPORTED_FUNCTIONS='["_$(EXP_FUNC)"]'
CFLAGS=-s -std=c++11 -s WASM=1 -s USE_SDL=2 -O3

$(JS): $(CPPSRC)
	$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
	$(RM) $(JS)
