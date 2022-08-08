//
//  ViewController.m
//  TestUNNotification
//
//  Created by dengjunjie on 2022/7/28.
//

#import "ViewController.h"
#import <UserNotifications/UNUserNotificationCenter.h>
#import <UserNotifications/UNNotificationContent.h>
#import <UserNotifications/UNNotificationTrigger.h>
#import <UserNotifications/UNNotificationRequest.h>
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
 
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge|UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
            
        }NSLog(@"success");
        
    }];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"test test test";
    content.subtitle = @"t1 t2 t3";
    content.body = @"body";
    content.badge = @1;
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60 repeats:YES];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requst" content:content trigger:trigger];
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            
    }];
}

@end
