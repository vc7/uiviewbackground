//
//  KMLowResBackgroundViewController.m
//  uiviewbackground
//
//  Created by Vincent on 2013/11/16.
//  Copyright (c) 2013年 Kumaya. All rights reserved.
//

#import "KMLowResBackgroundViewController.h"
#import "KMAppDelegate.h"

@interface KMLowResBackgroundViewController ()

@end

@implementation KMLowResBackgroundViewController

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Low-Res";
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
    
    // !!!: 設定圖片邊框
    UIImage  *buttonBackgroundImage = [backgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(3, 3, 3, 3)];
    
    // !!!: 根據想要加背景的 frame 建立一個 bitmap 繪圖區域
    UIGraphicsBeginImageContext(demoView.frame.size);
    
    // !!!: 繪製背景
    [buttonBackgroundImage drawInRect:demoView.bounds];
    UIImage *newButtonBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // !!!: 結束繪圖區域
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
