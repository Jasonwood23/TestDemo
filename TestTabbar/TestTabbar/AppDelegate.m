//
//  AppDelegate.m
//  TestTabbar
//
//  Created by dengjunjie on 2022/6/9.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "secondViewController.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self setupUI];
    return YES;
}
- (void)setupUI{
    // 1、创建3个单视图控制器,分别加到对应的导航控制器上
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    UINavigationController *firstNav = [[UINavigationController alloc]initWithRootViewController:firstVC];
    firstVC.view.backgroundColor = [UIColor redColor];
    
    secondViewController *secondVC = [[secondViewController alloc]init];
    UINavigationController *secondNav = [[UINavigationController alloc]initWithRootViewController:secondVC];
    secondVC.view.backgroundColor = [UIColor whiteColor];
    UIViewController *thirdVC = [[UIViewController alloc]init];
    UINavigationController *thirdNav = [[UINavigationController alloc]initWithRootViewController:thirdVC];
    thirdVC.view.backgroundColor = UIColor.blueColor;
    
    for (int i = 0; i < 9; i ++) {
        

    }
    // 2、创建一个不可变数组，装入3个导航控制器
    NSArray *controllers = @[firstNav, secondNav, thirdNav];
    
    // 3、创建一个标签视图控制器
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
    // 4、设置标签控制器的被控制对象（3个导航控制器）
    tabBarController.viewControllers = controllers;
    
    // 5、将标签控制器设置为window的根视图
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    
    // 设置标签视图控制器的一些属性：
    
    // 设置三个导航控制器在tabBarController上的按钮的标题和背景图片
    firstNav.tabBarItem.title = @"First";
    
    secondNav.tabBarItem.title = @"Second";
    
    thirdNav.tabBarItem.title = @"third";
    
    // 设置标签栏的渲染颜色（图标点击后的颜色）
    tabBarController.tabBar.tintColor = [UIColor purpleColor];
    
    // 设置整个tabBar的颜色（如果不设置，tabBar默认是毛玻璃效果）
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    
    // 设置某个tabBarItem的右上角的小角标内容（NSString）
    firstNav.tabBarItem.badgeValue = @"新消息";
    // 有两种方式可以往UITabBarController中添加子控制器
//    UIViewController *con1 = [[UIViewController alloc]init];
//    con1.view.backgroundColor = [UIColor grayColor];
//    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:con1];
    
//    nav1.tabBarItem.title = @"第四个按钮";
    // 第一种添加方法（该方法如果放在方法tabBarController.viewControllers = controllers之后，设置无效，原因不详）
    //    [tabBarController addChildViewController:nav1];
    // 第二种添加方法（该方法重新设置了viewControllers，会把前面的设置覆盖，所以也可以用这个方法删除某个按钮）
    //    tabBarController.viewControllers = @[firstNav, secondNav, thirdNav, nav1];
    
    // 设置tabBar的样式（没多大用处）
    tabBarController.tabBar.tintColor = UIColor.whiteColor;
    tabBarController.tabBar.barStyle = UIBarStyleDefault;
    /*
     UIBarStyleDefault
     UIBarStyleBlack // 黑色毛玻璃效果
     
     UIBarStyleBlackOpaque
     UIBarStyleBlackTranslucent
     */
    
    // 设置标签视图控制器默认选中的标签（系统默认选择第0个）
    tabBarController.selectedIndex = 0;
    // 设置标签视图控制器默认选中的视图控制器（效果和选择标签一样）
    //    tabBarController.selectedViewController = firstNav;
    
    // 设置代理
    tabBarController.delegate = self;
}


@end
