// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject <NSCopying>

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName;

- (instancetype)initWithFirstName:(NSString *)aFirstName
                         lastName:(NSString *)aLastName
                              age:(NSInteger)anAge NS_DESIGNATED_INITIALIZER;

+ (instancetype)personWithFirstName:(NSString *)aFirstName
                           lastName:(NSString *)aLastName
                                age:(NSInteger)anAge;

@property (copy, nonatomic) NSString *firstName;
@property (copy, nonatomic) NSString *lastName;
@property (readonly, nonatomic) NSString *fullName;
@property (nonatomic) NSInteger age;
@property (strong, nonatomic) Dog *dog;

@end
