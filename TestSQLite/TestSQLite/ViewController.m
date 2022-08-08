//
//  ViewController.m
//  TestSQLite
//
//  Created by dengjunjie on 2022/8/4.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()
@property (assign, nonatomic)sqlite3 *db;

@property (weak, nonatomic) IBOutlet UIButton *add;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createDataBase];
}


+ (NSString *)path{
    
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucmentPath = [documentArr firstObject];
    
    NSString *path = [NSString stringWithFormat:@"%@/test.sqlite",doucmentPath];
    NSLog(@"%@",path);
    return path;
    
}

- (sqlite3 *)createDataBase{
    
    
    NSString *path = [ViewController path];
    int databaseResult = sqlite3_open([path UTF8String], &_db);
    if (databaseResult != SQLITE_OK) {
        return nil;
    }
    NSString *createTable = @"CREATE TABLE IF NOT EXISTS CLASSA(ID INTEGER PRIMARY KEY , NAME TEXT, PHONE TEXT, AGE INTEGER)";
    
    char *erroMsg;
    if (sqlite3_exec(_db, [createTable UTF8String], NULL, NULL, &erroMsg)) {
        sqlite3_close(_db);
        sqlite3_free(erroMsg);
    }
    
    return _db;
}
- (IBAction)addDB:(id)sender {
    
    [self addItem];
    
}

- (BOOL)addItem{
    sqlite3_stmt *stmt = nil;
    int state = sqlite3_prepare_v2(_db, "INSERT CLASSA(ID,NAME,PHONE,AGE) values('1','TOM','1','21')", -1, nil, nil);
    if (state == SQLITE_OK) {
        return YES;
    }
    return NO;
    
}

@end
