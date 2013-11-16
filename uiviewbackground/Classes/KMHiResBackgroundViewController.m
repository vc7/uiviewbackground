//
//  KMHiResBackgroundViewController.m
//  uiviewbackground
//
//  Created by Vincent on 2013/11/16.
//  Copyright (c) 2013年 Kumaya. All rights reserved.
//

#import "KMHiResBackgroundViewController.h"
#import "KMAppDelegate.h"

@interface KMHiResBackgroundViewController ()

@end

@implementation KMHiResBackgroundViewController

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Hi-Res";
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
    
    UIView        *demoView        = [[UIView alloc] initWithFrame:CGRectMake(6, 20 + 6, 308, 140)];
    
    UIImage  *buttonBackgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    
    // !!!: 修改 function ，加入 scale 參數 (0.0f)，設定第二個參數 opaque 為 NO
    UIGraphicsBeginImageContextWithOptions(demoView.frame.size, NO, 0.0f);
    
    [buttonBackgroundImage drawInRect:demoView.bounds];
    UIImage *newButtonBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // !!!: 指定背景
    demoView.backgroundColor       = [UIColor colorWithPatternImage:newButtonBackgroundImage];
    
    self.view.backgroundColor      = [UIColor lightGrayColor];
    
    [self.view addSubview:demoView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
