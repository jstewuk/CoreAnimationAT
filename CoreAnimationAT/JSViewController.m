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
@property(nonatomic, strong) UIView *topLeftView;
@property(nonatomic, strong) UIView *topRightView;
@property(nonatomic, strong) UIView *bottomLeftView;
@property(nonatomic, strong) UIView *bottomRightView;


@end

@implementation JSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)addSpriteImage:(UIImage *)image
       withContentRect:(CGRect)rect
               toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsRect = rect;
}

- (void)addStretchableImage:(UIImage *)image
          withContentCenter:(CGRect)rect
                    toLayer:(CALayer *)layer
{
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = rect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 50)];
    label.text = @"Some Text";
    [self.view addSubview:label];

    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height/2);
    self.layerView.backgroundColor = [UIColor yellowColor];
    
    UIImage *image = [UIImage imageNamed:@"Stretch.png"];
    
    CGRect rect = CGRectMake(0.1, 0.1, 0.8, 0.8);
    [self addStretchableImage:image withContentCenter:rect toLayer:self.layerView.layer];
    
    
    [self.view addSubview:self.layerView];
}

@end
