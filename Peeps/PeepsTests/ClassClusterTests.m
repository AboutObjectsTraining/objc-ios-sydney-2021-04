// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>

@interface ClassClusterTests : XCTestCase

@end

@implementation ClassClusterTests

- (void)testStringClassCluster {
    NSString *s1 = [NSString alloc];
    NSString *s2 = [NSString alloc];
    NSMutableString *m1 = [NSMutableString alloc];
    
    s1 = [s1 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    s2 = [s2 initWithString:@"Woohoo!"];
    
    m1 = [m1 initWithFormat:@"%@ %@", @"Hello", @"World!"];
    
    [m1 appendString:@" Yay!"];
    [(NSMutableString *)s1 appendString:@" Oh Noes!"];
    
    char *foo = "Yipee!";
    NSString *s3 = [[NSString alloc] initWithUTF8String:foo];
    
    NSString *s4 = @"Woohoo!";
    
    NSLog(@"%@", s1);
    NSLog(@"%@", s2);
}

@end
