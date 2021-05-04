// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <stdio.h>

#define HELLO_WORLD "Hello World!"

void LoopOverArray(int *a) {
    
}


char Delta = 97;

void Capitalize3(char *word)
{
    static char delta = 'a' - 'A'; // Here delta is static. word[0] -= delta;
}

void MessWithStorageClasses(void) {
}

void MessWithStrings(void) {
    char foo[] = "xyz";
    char letters1[3];
    letters1[0] = 'a';
    letters1[1] = 'b';
    letters1[2] = 'c';

    printf("%s\n", letters1);
}

void MessWithArrays(void) {
    int first[] = { 1, 2, 3 };
    int *second = first;
//    int third[3] = first;
    printf("\n%p\n", second);
    printf("first value: %d\n", second[0]);
    printf("second element of first: %d\n", *(first + 1));
}

int main(int argc, const char * argv[]) {
    
//    printf(HELLO_WORLD);
    MessWithStrings();
//    MessWithArrays();
    return 0;
}
