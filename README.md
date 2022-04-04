# booleancalculator
how to compile in terminal:

flex boolcalc.l


bison boolcalc.y -d


gcc -lm boolcalc.tab.c -ll -ly -o filename


./filename
