#include <stdio.h>
#include <stdint.h>

// Based on slp3.c
void foo(int a1, int a2, int b1, int b2, int *A, int N) {
  for (int i=0; i<N; i += 2) {
    A[i] = a1*(a1+b1); // (1) 
    A[i+1] = a2*(a2+b2); // (2)
  }

  for(int i = 0; i < N; i++) {
    printf("A[i] is %d\n", A[i]);
  }
}

int main() {
  int* A = malloc(sizeof(int)*10);
  foo(2, 3, 1, 7, A, 10);
  return 0;
}
