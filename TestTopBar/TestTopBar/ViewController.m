//
//  ViewController.m
//  TestTopBar
//
//  Created by dengjunjie on 2022/6/14.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)UIScrollView *scrollView;
@property (copy, nonatomic)NSArray *titleArray;
@property (strong, nonatomic)NSMutableArray *buttonArray;
@property (strong, nonatomic)UIView *bottomView;

@property (nonatomic, assign)NSInteger currentItemIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupUI];
}
- (void)addSubViews{
    
    
    
}
- (void)setupUI{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.bottomView];
    
    
    for (int i = 0; i < self.titleArray.count; i ++) {
        CGFloat w = 80;
        CGFloat x = w * i;
        UIButton *titleButton = [[UIButton alloc]initWithFrame:CGRectMake(x, 0, w, 44)];
        titleButton.tag = 10000 + i;
        [titleButton setTitle:self.titleArray[i] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [titleButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        
        [titleButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.scrollView addSubview:titleButton];
        [self.buttonArray addObject:titleButton];
        
    }
    
}

- (void)click:(UIButton *)button{
    NSLog(@"%ld",(long)button.tag);
    
    
    for (UIButton *selectedButton in self.buttonArray) {
        if (button.tag == selectedButton.tag) {
            button.selected = YES;
            [self setContentSet:button.tag - 10000];
        }else{
            selectedButton.selected = NO;
            
        }
    }
    
}

- (void)setContentSet:(int)index{
    CGFloat x = 20 + 80 * index;
    [UIView animateWithDuration:0.1 animations:^{
        self.bottomView.frame = CGRectMake(x, 40, 40, 4);
    }];
    
    
    
}
#pragma mark -lazy
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"社会", @"国际", @"体育", @"娱乐", @"八卦", @"军事", @"科技", @"生活"];
    }
    return _titleArray;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 140, 640, 44)];
        _scrollView.backgroundColor = UIColor.whiteColor;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(840, 44);
    }
    
    return _scrollView;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(20, 40, 40, 4)];
        _bottomView.backgroundColor = UIColor.redColor;
    }
    return _bottomView;
}

- (NSMutableArray *)buttonArray{
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}

@end
