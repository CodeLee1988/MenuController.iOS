//
//  EESecondViewController.m
//  menu-controller-example
//
//  Created by Volodymyr Shevchyk Jr. on 14/04/16.
//  Copyright © 2016 Indeema Software Inc. All rights reserved.
//

#import "EESecondViewController.h"
#import "EEMenuContentProtocol.h"

@interface EESecondViewController () <EEMenuContentProtocol>

@end

@implementation EESecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - EEMenuContent protocol
- (void)EEMenuContentBottomInsetChanged:(CGFloat)bottomInset animated:(BOOL)animated {
    
}

@end
