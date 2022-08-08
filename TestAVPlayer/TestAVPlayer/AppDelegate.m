//
//  AppDelegate.m
//  TestAVPlayer
//
//  Created by dengjunjie on 2022/6/15.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    ViewController *vc = [ViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    
    return YES;
}


@end
