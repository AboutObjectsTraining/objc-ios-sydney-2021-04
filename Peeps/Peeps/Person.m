// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "Person.h"
#import "Dog.h"

@implementation Person

- (instancetype)init {
    return [self initWithFirstName:nil lastName:nil];
}

- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName {
    return [self initWithFirstName:aFirstName lastName:aLastName age:0];
}

// Designated initializer for the Person class.
- (id)initWithFirstName:(NSString *)aFirstName
               lastName:(NSString *)aLastName
                    age:(NSInteger)anAge {
    self = [super init];
    if (self == nil) return nil;
    
    // TODO: Should we copy these?
    _firstName = [aFirstName copy];
    _lastName = [aLastName copy];
    _age = anAge;
    
    return self;
}

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName
                                age:(NSInteger)anAge {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName age:anAge];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([super respondsToSelector:aSelector]) {
        return YES;
    }
    return [[self dog] respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if ([[self dog] respondsToSelector:aSelector]) {
        return [self dog];
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (NSString *)fullName {
    return [[NSString alloc] initWithFormat:@"%@ %@", [self firstName], [self lastName]];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, age: %@", [self fullName], @([self age])];
}

- (id)copyWithZone:(NSZone *)zone {
    Person *newPerson = [[[self class] alloc] init];
    newPerson->_firstName = [self firstName];
    newPerson->_lastName = [self lastName];
    newPerson->_age = [self age];
    return newPerson;
}

@end
