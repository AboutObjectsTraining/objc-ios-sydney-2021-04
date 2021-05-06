// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

@interface CLNCoolViewCell : UIView

- (instancetype)initWithOrigin:(CGPoint)origin
                         color:(UIColor *)color;

@property (copy, nonatomic) IBInspectable NSString *text;

@end
