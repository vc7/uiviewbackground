//
//  KMAppDelegate.m
//  uiviewbackground
//
//  Created by Vincent on 2013/11/15.
//  Copyright (c) 2013年 Kumaya. All rights reserved.
//

#import "KMAppDelegate.h"
#import "KMButtonViewController.h"
#import "KMNormalBackgroundViewController.h"
#import "KMLowResBackgroundViewController.h"
#import "KMHiResBackgroundViewController.h"

@interface KMAppDelegate ()

- (void)preloadUIElements;

@end

@implementation KMAppDelegate

@synthesize backgroundImage;

#pragma mark - UIApplication

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self preloadUIElements];
    
    UITabBarController *tabBarController  = [[UITabBarController alloc] init];
    [tabBarController setViewControllers: @[[[KMButtonViewController alloc] init],
                                            [[KMNormalBackgroundViewController alloc] init],
                                            [[KMLowResBackgroundViewController alloc] init],
                                            [[KMHiResBackgroundViewController alloc] init]
                                            ]];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - Private Methods

/*!
 This method preload the sharing UI elements.
 */
- (void)preloadUIElements
{
    backgroundImage = [UIImage imageNamed:@"backgroundImage.png"];
}

@end
