//
//  ViewController.m
//  TestModel
//
//  Created by dengjunjie on 2022/5/31.
//

#import "ViewController.h"
#import "TestCellModel.h"
#import "TestCollectionViewCell.h"
#import "TestTestCell.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (copy, nonatomic)TestCellModel *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.model getModelData:@"TestCollectionViewCell" ID:@"TestCollectionViewCell" Class:[TestCollectionViewCell class]];
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:self.model.cellName bundle:nil] forCellWithReuseIdentifier:self.model.cellID];
    
    
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.model.cellName isEqualToString:@"TestCollectionViewCell"]) {
        
    }
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.model.cellID forIndexPath:indexPath];
    
    
    return cell;
    
    
}





#pragma mark - lazy
- (TestCellModel *)model{
    
    if (!_model) {
        _model = [[TestCellModel alloc]init];
    }
    
    return _model;
    
}

@end
