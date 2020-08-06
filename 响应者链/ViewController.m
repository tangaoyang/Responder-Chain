//
//  ViewController.m
//  响应者链
//
//  Created by cinderella on 2020/8/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "ViewController.h"
#import "FindResponderViewController.h"
#import "UnResponderViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *findButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:findButton];
    findButton.frame = CGRectMake(120, 180, 300, 50);
    findButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [findButton setTitle:@"findResponder" forState:UIControlStateNormal];
    findButton.tintColor = [UIColor blackColor];
    [findButton addTarget:self action:@selector(findResponder) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *unResponderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:unResponderButton];
    unResponderButton.frame = CGRectMake(120, 380, 300, 50);
    unResponderButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [unResponderButton setTitle:@"unResponder" forState:UIControlStateNormal];
    unResponderButton.tintColor = [UIColor blackColor];
    [unResponderButton addTarget:self action:@selector(unResponder) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)findResponder {
    FindResponderViewController *find = [[FindResponderViewController alloc] init];
    [self presentViewController:find animated:NO completion:nil];
}

- (void)unResponder {
    UnResponderViewController *unResponder = [[UnResponderViewController alloc] init];
    [self presentViewController:unResponder animated:NO completion:nil];
}

@end
