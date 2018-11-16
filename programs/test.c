#include <stdio.h>

int quotient(int a, int b) {
  int count = 0;
  while(a >= b) {
    a -= b;
    count++;
  }
  return count;
}

int remaind(int a, int b) {
  while(a >= b) {
    a -= b;
  }
  return a;
} 

int main() {
  printf("37 / 3 = %d ... %d\n", quotient(37, 3), remaind(37, 3));
}
