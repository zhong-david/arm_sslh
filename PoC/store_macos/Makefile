all: spectre

#PASS = -mspeculative-load-hardening
DAVID_PATH = /Users/dzhong/llvm-project/build/bin

main.ll: main.c
	${DAVID_PATH}/clang ${PASS} -emit-llvm -S main.c -Xclang -disable-O0-optnone -o main.ll

main.o: main.ll
	${DAVID_PATH}/opt -O0 main.ll -o main.o

eviction.ll: eviction.c
	${DAVID_PATH}/clang ${PASS} -emit-llvm -S eviction.c -Xclang -disable-O0-optnone -o eviction.ll

eviction.o: eviction.ll
	${DAVID_PATH}/opt eviction.ll -o eviction.o

counter_thread.ll: counter_thread.c
	${DAVID_PATH}/clang ${PASS} -emit-llvm -S counter_thread.c -Xclang -disable-O0-optnone -o counter_thread.ll

counter_thread.o: counter_thread.ll
	${DAVID_PATH}/opt counter_thread.ll -o counter_thread.o

spectre: main.o eviction.o counter_thread.o 
	${DAVID_PATH}/clang main.c eviction.c counter_thread.c -o spectre -O0

main.s: main.ll
	${DAVID_PATH}/clang -O0 -mspeculative-load-hardening -S -o main.s main.ll

vizmain:
	opt -disable-output -passes="dot-cfg" main.ll
	cat .main.dot | dot -Tpdf > main.pdf


clean:
	rm spectre *.o *.ll

