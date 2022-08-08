//
//  TestCellModel.m
//  TestModel
//
//  Created by dengjunjie on 2022/5/31.
//

#import "TestCellModel.h"
#import "TestCollectionViewCell.h"
#import "TestTestCell.h"
@implementation TestCellModel


- (void)getModelData:(NSString *)cellName ID:(NSString *)cellID Class:(Class)cellClass{
    self.cellClass = cellClass;
    self.cellID = cellID;
    self.cellName = cellName;
    
    TestCellModel *model = [[TestCellModel alloc]init];
    model.cellName = @"TestTestCell";
    model.cellClass = [TestCollectionViewCell class];
//    model.cellID = NSClassFromString(model.cellClass);
    
    
    
    
    
}


@end
