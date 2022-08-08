//
//  ViewController.m
//  TestBug
//
//  Created by dengjunjie on 2022/6/23.
//

#import "ViewController.h"

@interface ViewController ()
@property (copy, nonatomic)NSArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[@"1",@"2",@"3",@"4",@"5"];
    
    NSLog(@"%@",self.array[6]);
    
    
}


@end
