//
//  NotificationManagerViewController.m
//  TestNotification
//
//  Created by dengjunjie on 2022/6/9.
//
#import "NotificationManagerViewController.h"


@interface NotificationManagerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
@property (copy, nonatomic)TestModel *model;
@property (assign, nonatomic)int count;

@end

@implementation NotificationManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = UIColor.clearColor;
}

- (IBAction)clickButton:(id)sender {
    self.count ++;
    self.model.countLabel = [NSString stringWithFormat:@"%d", self.count];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"pushpush" object:self.model.countLabel userInfo:nil];
//    if ([_delegate respondsToSelector:@selector(sendMessage:)]) {
//        [_delegate sendMessage:self.model.countLabel];
//    }
    if (self.clickBlock) {
        self.clickBlock(self.model.countLabel);
    }
    
}



- (TestModel *)model{
    
    if (!_model) {
        _model = [[TestModel alloc]init];
    }
    
    return _model;
    
    
}

@end
