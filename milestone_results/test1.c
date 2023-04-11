#include <stdio.h>
#include <stdint.h>

int main() {
  int A[4];
  for(int i = 0; i < 5; i++) {
    A[i] = i;
  }

  for(int i = 0; i < 5; i++) {
    printf("A[i] is %d\n", A[i]);
  }
  return 0;
}
