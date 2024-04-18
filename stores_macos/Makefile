all: spectre

PASASS = -mspeculative-load-hardening

cleanmain:
	rm main.ll main.s

spectre:
	clang ${PASS} main.c eviction.c counter_thread.c -o spectre -O0

main.ll: main.c
	clang -O0 ${PASS} -emit-llvm -S main.c -Xclang -disable-O0-optnone -o main.ll

main.s: main.ll
	clang -S -o main.s main.ll

otool_disassembler:
	otool -tvV spectre > spectre.s

vizmain:
	opt -disable-output -passes="dot-cfg" main.ll
	cat .victim_function.dot | dot -Tpdf > victim.pdf


clean:
	rm spectre *.o *.ll *.s

