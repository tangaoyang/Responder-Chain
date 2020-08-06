

//
//  UnResponderViewController.m
//  响应者链
//
//  Created by cinderella on 2020/8/6.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "UnResponderViewController.h"
#import "TAYView.h"

@interface UnResponderViewController ()

@end

@implementation UnResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    AlphaView *alphaView = [[AlphaView alloc] init];
    [self.view addSubview:alphaView];
    alphaView.backgroundColor = [UIColor whiteColor];
    alphaView.alpha = 0;
    alphaView.frame = CGRectMake(50, 50, 100, 50);
    
    FatherView *fatherView = [[FatherView alloc] init];
    [self.view addSubview:fatherView];
    fatherView.backgroundColor = [UIColor grayColor];
    fatherView.frame = CGRectMake(150, 200, 100, 50);
    
    OverView *overView = [[OverView alloc] init];
    [fatherView addSubview:overView];
    overView.backgroundColor = [UIColor greenColor];
    overView.frame = CGRectMake(150, 70, 100, 50);
    
    UserInteractionEnabledView *userInteractionEnabledView = [[UserInteractionEnabledView alloc] init];
    [self.view addSubview:userInteractionEnabledView];
    userInteractionEnabledView.backgroundColor = [UIColor purpleColor];
    userInteractionEnabledView.frame = CGRectMake(150, 300, 100, 50);
    userInteractionEnabledView.userInteractionEnabled = NO;
    
    HiddenView *hiddenView = [[HiddenView alloc] init];
    [self.view addSubview:hiddenView];
    hiddenView.backgroundColor = [UIColor orangeColor];
    hiddenView.frame = CGRectMake(150, 400, 100, 50);
    hiddenView.hidden = YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
