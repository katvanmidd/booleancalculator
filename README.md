# booleancalculator
how to compile in terminal:

flex bctrash.l


bison bctrash.y -d


gcc -lm bctrash.tab.c -ll -ly -o filename


./filename
