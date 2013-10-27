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
@property(nonatomic, strong) UIView *layerView;
@property(nonatomic, strong) CALayer *colorLayer;



@end

@implementation JSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 50)];
    label.text = @"Some Text";
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Change Color" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(self.view.bounds.size.width / 2,
                                self.view.bounds.size.height / 2 + 130);
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    [self addLayerView];
    
    [self addColorLayerAsSublayer];
    
}

- (void)addLayerView {
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height/2);
    self.layerView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.layerView];

}

- (void)addColorLayerAsSublayer {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (void)changeColor {
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    
    // WTH does this have to go before the propery animation to make it happen at completion???
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.colorLayer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
        self.colorLayer.affineTransform = transform;
    }];
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    
    [CATransaction commit];
    
}

@end
