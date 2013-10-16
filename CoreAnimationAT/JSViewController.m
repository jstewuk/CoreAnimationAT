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

@end

@implementation JSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height/2);
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50.0, 50.0, 100.0, 100.0);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];
}

@end
