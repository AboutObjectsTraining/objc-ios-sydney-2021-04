// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

@implementation CLNCoolViewController

- (IBAction)addCell {
    NSLog(@"In %s", __func__);
    CLNCoolViewCell *cell = [[CLNCoolViewCell alloc] init];
    cell.text = self.textField.text;
    cell.backgroundColor = UIColor.systemBlueColor;
    [self.contentView addSubview:cell];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
