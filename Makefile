compile:
	flex bctrash.l
	bison bctrash.y -d
	gcc -lm bctrash.tab.c -ll -ly -o bctrash

clean:
	rm bctrash.tab.c bctrash.tab.h lex.yy.c bctrash
