//
//  AdPopView.m
//  RoomDirection
//
//  Created by 韩新辉 on 2017/11/21.
//  Copyright © 2017年 韩新辉. All rights reserved.
//

#import "AdPopView.h"

#define SCRWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCRHEIGHT [UIScreen mainScreen].bounds.size.height


@interface AdPopView()
@property (strong, nonatomic) UIImageView *popImageView;/**<弹出视图*/

@property (strong, nonatomic) UIButton *closeBtn;/**<关闭按钮*/
@property (strong, nonatomic) UIButton *takeBtn;/**<参与按钮*/

@end


@implementation AdPopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.55];
        [self creatAdUI];
    }
    return self;
}
-(void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    UIImage *imageBg = [UIImage imageNamed:imageName];
    [self.popImageView setImage:imageBg];
    CGRect imgFrame;
    imgFrame.size.width = SCRWIDTH - 50;
    imgFrame.size.height = imgFrame.size.width *(imageBg.size.width/imageBg.size.height);
    self.popImageView.frame = imgFrame;
    self.popImageView.center = self.center;

    CGRect closeFrame;
    closeFrame.size.width = 20;
    closeFrame.size.height = 20;
    self.closeBtn.frame = closeFrame;
    CGFloat closex = [UIScreen mainScreen].bounds.size.width *0.5;
    CGFloat closey =  self.popImageView.frame.origin.y +self.popImageView.frame.size.height+ 20;
    CGPoint closeCenter={closex,closey};
    self.closeBtn.center = closeCenter;

    CGRect takeFrame;
    takeFrame.size.width = 150;
    takeFrame.size.height = 55;
    self.takeBtn.frame = takeFrame;
    CGFloat takex = self.popImageView.frame.size.width * 0.5;
    CGFloat takey =  self.popImageView.frame.size.height - 70;
    CGPoint takeCenter={takex,takey};
    self.takeBtn.center = takeCenter;
}

-(void)setIsDeleteBtn:(BOOL)isDeleteBtn{
    _isDeleteBtn = isDeleteBtn;
    [self.closeBtn setHidden:isDeleteBtn];
}

#pragma mark - 创建广告弹窗
-(void)creatAdUI{
    
    self.popImageView = [[UIImageView alloc] init];
    self.popImageView.userInteractionEnabled = YES;
    [self.popImageView setContentMode:UIViewContentModeScaleToFill];
    [self addSubview:self.popImageView];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.closeBtn setImage:[UIImage imageNamed:@"closePop"] forState:UIControlStateNormal];
    self.closeBtn.tag = PopViewCloseTag;
    [self.closeBtn addTarget:self action:@selector(userDoSomgthing:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeBtn];
    
    self.takeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.takeBtn setImage:[UIImage imageNamed:@"takeIn"] forState:UIControlStateNormal];
     self.takeBtn.tag = PopViewTakeTag;
    [self.takeBtn addTarget:self action:@selector(userDoSomgthing:) forControlEvents:UIControlEventTouchUpInside];
    [self.popImageView addSubview:self.takeBtn];
}
-(void)userDoSomgthing:(UIButton*)btn{
    if (self.didSelectButtonTag) {
        self.didSelectButtonTag((int)btn.tag);
    }
}
/*
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
}
*/

@end
