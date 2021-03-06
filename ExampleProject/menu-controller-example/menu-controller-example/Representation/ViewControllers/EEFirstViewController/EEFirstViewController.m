//
//  EETitleViewController.m
//  menu-controller-example
//
//  Created by Volodymyr Shevchyk Jr. on 13/04/16.
//  Copyright © 2016 Indeema Software Inc. All rights reserved.
//

#import "EEFirstViewController.h"

@interface EEFirstViewController () {
    IBOutlet UIScrollView *_scrollView;
}

@end

@implementation EEFirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - EEMenuContent protocol
- (void)EEMenuContentBottomInsetChanged:(CGFloat)bottomInset animated:(BOOL)animated {
    if (self.isViewLoaded) {
        if (animated) {
            [UIView animateWithDuration:0.25f animations:^{
                [_scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f)];
                [_scrollView setScrollIndicatorInsets:UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f)];
            }];
        } else {
            [_scrollView setContentInset:UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f)];
            [_scrollView setScrollIndicatorInsets:UIEdgeInsetsMake(0.0f, 0.0f, bottomInset, 0.0f)];
        }
    }
}

@end
