//
//  KMButtonViewController.m
//  uiviewbackground
//
//  Created by Vincent on 2013/11/16.
//  Copyright (c) 2013年 Kumaya. All rights reserved.
//

#import "KMButtonViewController.h"
#import "KMAppDelegate.h"

@interface KMButtonViewController ()

@end

@implementation KMButtonViewController

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Button";
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Get the background image from app delegate
    KMAppDelegate *appDelegate     = (KMAppDelegate *)[[UIApplication sharedApplication] delegate];
    UIImage       *backgroundImage = appDelegate.backgroundImage;
    
    UIButton *demoButton            = [UIButton buttonWithType:UIButtonTypeCustom];
    demoButton.frame                = CGRectMake(6, 20 + 6, 308, 140);
    
    // !!!: 設定圖片邊框
    UIImage  *buttonBackgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    
    // !!!: 在這裡設定背景圖片
    [demoButton setBackgroundImage:buttonBackgroundImage forState:UIControlStateNormal];
    
    [demoButton addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor  = [UIColor lightGrayColor];
    
    [self.view addSubview:demoButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button click action method

- (void)buttonClickAction:(id)sender
{
    NSLog(@"Button Clicked!");
}

@end
