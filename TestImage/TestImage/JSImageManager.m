//
//  JSImageManager.m
//  TestImage
//
//  Created by dengjunjie on 2022/6/8.
//

#import "JSImageManager.h"
@interface JSImageManager()


@end
@implementation JSImageManager

+ (void)downFromInternet:(NSString *)url{
    NSURL *downUrl = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:downUrl];
    
    
    
}



@end
