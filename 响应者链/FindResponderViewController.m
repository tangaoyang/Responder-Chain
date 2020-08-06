//
//  FindResponderViewController.m
//  响应者链
//
//  Created by cinderella on 2020/8/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "FindResponderViewController.h"
#import "TAYView.h"

@interface FindResponderViewController ()

@property (nonatomic, strong) YellowView *yellowView;

@end

@implementation FindResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TAYView *whiteView = [[TAYView alloc] init];
    [self.view addSubview:whiteView];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.frame = self.view.bounds;
    
    BlueView *blueView = [[BlueView alloc] init];
    [whiteView addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.frame = CGRectMake(50, 300, 320, 300);
    
    RedView *redView = [[RedView alloc] init];
    [whiteView addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(50, 150, 320, 100);
    
    OrangeView *orangeView = [[OrangeView alloc] init];
    [blueView addSubview:orangeView];
    orangeView.backgroundColor = [UIColor orangeColor];
    orangeView.frame = CGRectMake(20, 30, 280, 100);
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [orangeView addGestureRecognizer:tapGesturRecognizer];
    
    self.yellowView = [[YellowView alloc] init];
    [blueView addSubview:_yellowView];
    _yellowView.backgroundColor = [UIColor yellowColor];
    _yellowView.frame = CGRectMake(20, 160, 280, 100);
    
}

- (void)tapAction:(id)tap {
    NSLog(@"点击了orangeView");
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIResponder *nextResponder = _yellowView.nextResponder;
    NSMutableString *pre = [NSMutableString stringWithString:@"--"];
    NSLog(@"YellowView");
    while (nextResponder) {
        NSLog(@"%@%@", pre, NSStringFromClass([nextResponder class]));
        [pre appendString:@"--"];
        nextResponder = nextResponder.nextResponder;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesBegan", NSStringFromClass([self class]));
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesMoved", NSStringFromClass([self class]));
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ touchesEnded", NSStringFromClass([self class]));
    [super touchesEnded:touches withEvent:event];
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
