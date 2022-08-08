//
//  ViewController.m
//  TestAVPlayer
//
//  Created by dengjunjie on 2022/6/15.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (strong, nonatomic)AVPlayer *player;
@property (strong, nonatomic)AVPlayerItem *playerItem;
@property (strong, nonatomic)AVPlayerLayer *playerLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    [self.view.layer addSublayer:self.playerLayer];
//    [self.playerLayer player];
}




#pragma mark - lazy
- (AVPlayerItem *)playerItem{
    if (!_playerItem) {
        _playerItem = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:@""]];
        
    }
    return _playerItem;
}
- (AVPlayer *)player{
    if (!_player) {
        _player = [[AVPlayer alloc]initWithPlayerItem:self.playerItem];
        
    }
    return _player;
}
- (AVPlayerLayer *)playerLayer{
    if (!_playerLayer) {
        
        _playerLayer = [[AVPlayerLayer alloc]initWithLayer:self.player];
        _playerLayer.frame = CGRectMake(0, 100, 375, 300);
    }
    
    return _playerLayer;
    
    
    
}

@end
