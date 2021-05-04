// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <XCTest/XCTest.h>
#import <Peeps/Peeps.h>

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

- (void)testInitializePerson {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    NSLog(@"%@", [fred firstName]);
}

- (void)testFullName {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    NSLog(@"%@", [fred fullName]);
}

- (void)testDescription {
    Person *fred = [[Person alloc] init];
    [fred setFirstName:@"Fred"];
    [fred setLastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"%@", fred);
}

- (void)testConvenienceInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"];
    [fred setAge:42];
    NSLog(@"%@", fred);
}

- (void)testDesignatedInitializer {
    Person *fred = [[Person alloc] initWithFirstName:@"Fred"
                                            lastName:@"Smith"
                                                 age:42];
    NSLog(@"%@", fred);
}

- (void)testFactoryMethod {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"
                                           age:42];
    NSLog(@"%@", fred);
}

- (void)testMessageToNil {
    NSString *name = nil;
    
    Person *fred = [Person personWithFirstName:[name capitalizedString]
                                      lastName:@"Smith"
                                           age:42];
    NSLog(@"%@", fred);
}

- (void)testMessageToNilDog {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"
                                           age:42];
    [fred setDog:[[Dog alloc] init]];
    // [[fred dog] bark];
    
    NSLog(@"In %s", __func__);
    
//    SEL selector = @selector(personWithFirstName:lastName:age:);
//    
//    if ([fred respondsToSelector:selector]) {
//        [fred performSelector:selector];
//    }
    
    if ([fred respondsToSelector:@selector(bark)]) {
        [(id)fred bark];
    }
    
    if ([fred respondsToSelector:@selector(capitalizedString)]) {
        [(id)fred capitalizedString];
    }
}

- (void)testCopyingPerson {
    Person *fred = [Person personWithFirstName:@"Fred"
                                      lastName:@"Smith"
                                           age:42];
    
    if ([Person conformsToProtocol:@protocol(NSCopying)]) {
        Person *fredsClone = [fred copy];
        NSLog(@"Fred's clone: %@", fredsClone);
    }
}
    

@end
