//
//  ViewController.m
//  TestBlue
//
//  Created by dengjunjie on 2022/8/8.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "BabyBluetooth.h"

@interface ViewController ()<CBCentralManagerDelegate, CBPeripheralDelegate>

//@property (strong, nonatomic)CBCentralManager *manager;
//
@property (strong) NSMutableArray *peripherals;

@end

@implementation ViewController{
    
    BabyBluetooth *baby;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    baby = [BabyBluetooth shareBabyBluetooth];

    [self babyDelegate];
    
    baby.scanForPeripherals().begin();
    
    
//    self.manager = [[CBCentralManager alloc]initWithDelegate:self queue:dispatch_get_main_queue()];
}

- (void)babyDelegate{
    
    [baby setBlockOnDiscoverToPeripherals:^(CBCentralManager *central, CBPeripheral *peripheral, NSDictionary *advertisementData, NSNumber *RSSI) {
        NSLog(@"搜索到了设备%@",peripheral.name);
        if ([peripheral.name hasPrefix:@"Redmi"]) {
            
            
            UIAlertController *alerController = [UIAlertController alertControllerWithTitle:@"搜索到了蓝牙" message:[NSString stringWithFormat:@"发现%@是否确定连接？",peripheral.name] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                baby.having(peripheral).enjoy();
            }];
            
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alerController addAction:sureAction];
            [alerController addAction:cancel];
            
            [self presentViewController:alerController animated:YES completion:nil];
        }
    }];
    
    [baby setFilterOnDiscoverPeripherals:^BOOL(NSString *peripheralName, NSDictionary *advertisementData, NSNumber *RSSI) {
//        if ([peripheralName hasPrefix:@""]) {
//            return YES;
//        }
        if ([peripheralName hasPrefix:@"Redmi"]) {
     
            
            
            return YES;
        }
        return NO;
        
    }];
    
    [baby setFilterOnConnectToPeripherals:^BOOL(NSString *peripheralName, NSDictionary *advertisementData, NSNumber *RSSI) {
        if ([peripheralName hasPrefix:@"Redmi"]) {
            return YES;
        }
        return NO;
    }];
    
    [baby setBlockOnConnected:^(CBCentralManager *central, CBPeripheral *peripheral) {
       
        NSLog(@"连接成功%@",peripheral.name);
    }];
    
}
- (void)sureToC{

//    baby.having(self.peripherals).and.then.connectToPeripherals(self.peripherals.firstObject).discoverServices().begin();
    
    
}
#pragma mark - delegate
////开关蓝牙
//- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
//    switch (central.state) {
//        case CBManagerStateUnknown:
//
//            break;
//        case CBManagerStateUnsupported:
//            NSLog(@"---CBManagerStateUnsupported");
//            break;
//        case CBManagerStateResetting:
//            NSLog(@"---CBManagerStateResetting");
//            break;
//        case CBManagerStateUnauthorized:
//            NSLog(@"---CBManagerStateUnauthorized");
//            break;
//        case CBManagerStatePoweredOn:
//            NSLog(@"---CBManagerStatePoweredOn");
//
//            [self.manager scanForPeripheralsWithServices:nil options:nil];
//            break;
//        case CBManagerStatePoweredOff:
//            NSLog(@"---CBManagerStatePoweredOff");
//            break;
//        default:
//            break;
//    }
//
//}
////发现设备
//- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI{
//    NSLog(@"%@",peripheral.name);
//
//    if ([peripheral.name hasPrefix:@"Redmi"]) {
//
//        UIButton *button = [[UIButton alloc]init];
//        [button setTitle:@"确定" forState:UIControlStateNormal];
//
//        [self.peripherals addObject:peripheral];
//
//        [self.manager connectPeripheral:peripheral options:nil];
//    }
//}
//
//- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
//
//    NSLog(@"连接成功%@",peripheral.name);
//
//    [peripheral setDelegate:self];
//
//    [peripheral discoverServices:nil];
//
//}
//
//- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
//
//    NSLog(@"连接失败%@---%@",peripheral.name,error.localizedDescription);
//
//}
//
//- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error{
//    NSLog(@"断开连接%@",peripheral.name);
//
//}
//
//- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error{
//
//    if (error) {
//        NSLog(@"%@----%@",peripheral.name, error.description);
//        return;
//    }
//    for (CBService *serivices in peripheral.services) {
//        NSLog(@"%@",serivices.UUID);
//        [peripheral discoverCharacteristics:nil forService:serivices];
//    }
//
//}

- (NSMutableArray *)peripherals{
    
    if (!_peripherals) {
        _peripherals = [[NSMutableArray alloc]init];
    }
    return _peripherals;
    
}

@end
