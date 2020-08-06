
//
//  UIView+ChangeMethod.m
//  响应者链
//
//  Created by cinderella on 2020/8/5.
//  Copyright © 2020 cinderella. All rights reserved.
//

#import "UIView+ChangeMethod.h"
#import <objc/runtime.h>

@implementation UIView (ChangeMethod)

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

+ (void)load {
    Method origin = class_getInstanceMethod([UIView class], @selector(hitTest:withEvent:));
    Method custom = class_getInstanceMethod([UIView class], @selector(tay_hitTest:withEvent:));
    method_exchangeImplementations(origin, custom);
    
    origin = class_getInstanceMethod([UIView class], @selector(pointInside:withEvent:));
    custom = class_getInstanceMethod([UIView class], @selector(tay_pointInside:withEvent:));
    method_exchangeImplementations(origin, custom);
}

- (UIView *)tay_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ hitTest", NSStringFromClass([self class]));
    UIView *result = [self tay_hitTest:point withEvent:event];
    NSLog(@"%@ hitTest return: %@", NSStringFromClass([self class]), NSStringFromClass([result class]));
    return result;
}

- (BOOL)tay_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%@ pointInside", NSStringFromClass([self class]));
    BOOL result = [self tay_pointInside:point withEvent:event];
    NSLog(@"%@ pointInside return: %@", NSStringFromClass([self class]), result ? @"YES":@"NO");
    return result;
}

@end
