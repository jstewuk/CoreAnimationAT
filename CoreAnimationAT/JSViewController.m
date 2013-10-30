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
@property(nonatomic, strong) UIView *containerView;



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
    self.view.backgroundColor = [UIColor grayColor];
    
    [self addContainerView];
    
    UIBezierPath *path = [self path];
    [self drawPathInContainerView:path];
    CALayer *shipLayer = [self shipAddedToContainerView];
    [self addKFAnimationTo:shipLayer onPath:path];
}

- (void)addContainerView {
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 300.0)];
    self.containerView.center = self.view.center;
    self.containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.containerView];
}

- (UIBezierPath *)path {
    UIBezierPath *bPath = [[UIBezierPath alloc] init];
    [bPath moveToPoint:CGPointMake(0, 150)];
    [bPath addCurveToPoint:CGPointMake(300, 150)
             controlPoint1:CGPointMake(75, 0)
             controlPoint2:CGPointMake(225, 300)];
    return bPath;
}

- (void)drawPathInContainerView:(UIBezierPath *)path {
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:pathLayer];
}

- (CALayer *)shipAddedToContainerView {
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship.png"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    return shipLayer;
}

- (void)addKFAnimationTo:(CALayer *)layer onPath:(UIBezierPath *)path {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.duration = 4.0;
    anim.path = path.CGPath;
    anim.rotationMode = kCAAnimationRotateAuto;
    [layer addAnimation:anim forKey:nil];
    
    CABasicAnimation *rotAnim = [CABasicAnimation animation];
    rotAnim.keyPath = @"transform.rotation";
    rotAnim.duration = 2.0;
    rotAnim.byValue = @(M_PI * 2);
    [layer addAnimation:rotAnim forKey:nil];
}

/*
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
*/

@end