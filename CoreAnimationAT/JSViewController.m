//
//  JSViewController.m
//  CoreAnimationAT
//
//  Created by James Stewart on 10/16/13.
//  Copyright (c) 2013 StewartStuff. All rights reserved.
//

#import "JSViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface JSViewController ()
@property(nonatomic, strong) CALayer *colorLayer;



@end

@implementation JSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addButton];
    
    [self addColorLayerAsSublayer];
    
}

- (void)addColorLayerAsSublayer {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);
    self.colorLayer.position = CGPointMake(self.view.bounds.size.width / 2,
                                           self.view.bounds.size.height/ 2);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromLeft;
    self.colorLayer.actions = @{@"backgroundColor": transition};
    
    [self.view.layer addSublayer:self.colorLayer];
}

- (void)addButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Change Color" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(self.view.bounds.size.width / 2,
                                self.view.bounds.size.height/ 2 + 75);
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)changeColor {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.toValue = (__bridge id)color.CGColor;
    animation.delegate = self;
    
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
    [CATransaction commit]; 
}
@end