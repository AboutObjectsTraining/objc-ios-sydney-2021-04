// Copyright (C) 2021 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (UIViewController *)rel_destinationViewController {
    UIViewController *controller = self.destinationViewController;
    if (![controller isKindOfClass:UINavigationController.class]) {
        return controller;
    }
    
    return (UINavigationController *)controller.childViewControllers.firstObject;
}

@end
