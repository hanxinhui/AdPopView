//
//  ViewController.m
//  AdvertisingPopups
//
//  Created by 韩新辉 on 2017/11/27.
//  Copyright © 2017年 韩新辉. All rights reserved.
//

#import "ViewController.h"
#import "AdPopView.h"


#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()
@property (strong, nonatomic) AdPopView *popvc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self popAdView];
    
}
-(void)popAdView{
    __weak typeof(self) weakSelf = self;
    self.popvc = [[AdPopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.popvc setImageName:@"popBg"];
    //是否显示关闭按钮，默认显示
//    [self.popvc setIsDeleteBtn:NO];
    [self.popvc setDidSelectButtonTag:^(int index) {
        if (index == PopViewTakeTag) {//参与
            [weakSelf.popvc removeFromSuperview];
        } else {//关闭
            [weakSelf.popvc removeFromSuperview];

        }
    }];
    [self.view addSubview:self.popvc];
//    [[[UIApplication sharedApplication].delegate window]addSubview:self.popvc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
