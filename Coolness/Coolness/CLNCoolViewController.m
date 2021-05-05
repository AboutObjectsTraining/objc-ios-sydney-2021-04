// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolViewController

- (void)loadView {
    CLNCoolView *coolView = [[CLNCoolView alloc] init];
    self.view = coolView;
    self.view.backgroundColor = UIColor.brownColor;
    
    CLNCoolViewCell *cell1 = [[CLNCoolViewCell alloc] initWithOrigin:CGPointMake(20, 100) color:UIColor.purpleColor];
    CLNCoolViewCell *cell2 = [[CLNCoolViewCell alloc] initWithOrigin:CGPointMake(60, 160) color:UIColor.orangeColor];
    [coolView addCell:cell1];
    [coolView addCell:cell2];
    
    cell1.text = @"Hello World! 🌎🌍🌏";
    cell2.text = @"Cool View Cells Rawk! 🍾🥂";
}



@end
