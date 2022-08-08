//
//  ViewController.m
//  TestTabbar
//
//  Created by dengjunjie on 2022/6/9.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{
    self.view.backgroundColor = UIColor.whiteColor;
}


@end
