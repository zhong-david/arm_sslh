all: spectre

PASS = -mspeculative-load-hardening

spectre: 
	clang ${PASS} main.c eviction.c counter_thread.c spectre.c -o spectre

clean:
	rm spectre *.o *.ll

