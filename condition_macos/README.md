Code under this directory corresponds with the conditional attack as mention in the paper "Ultimate SLH: Taking Speculative Load Hardening to the Next Level."

Utilize the Makefile to compile the correwsponding attack.

To compile, run:

$ make spectre
$ ./spectre 1  # Non-zero value is leaked if the top row is noticably smaller than the bottom row
$ ./spectre 0  # Zero value is leaked if the bottom row is noticably smaller than the top row

