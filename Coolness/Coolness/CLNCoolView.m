// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolView

- (void)addCell:(CLNCoolViewCell *)cell {
    [self addSubview:cell];
}

@end
