// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

void sayHello(void) {
    printf("Hello!\n");
}

void doNTimes(int count, void (*thingToDo)(void)) {
    for (int i = 0; i < count; i++) {
        thingToDo();
    }
}

@interface BlockLiteralTests : XCTestCase
@end

@implementation BlockLiteralTests

- (void)testBlockLiteral {
    void (^myBlock)(void);
    
    char __block *message = "Woohoo!";
    int __block foo = 3;
    
    myBlock = ^{
        foo += 2;
        message = "Yay!";
        printf("Hello! %s, foo is %d\n", message, foo);
    };
    
    myBlock();
    
    NSLog(@"%@", myBlock);
}

- (void)testFunctionPointer {
    void (*myFunctionPtr)(void);
    
    myFunctionPtr = sayHello;
    
    myFunctionPtr();
}

- (void)testPassingFunctionPointer {
    doNTimes(3, sayHello);
}

@end
