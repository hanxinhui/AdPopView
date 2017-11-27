//
//  AdPopView.h
//  RoomDirection
//
//  Created by 韩新辉 on 2017/11/21.
//  Copyright © 2017年 韩新辉. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(int,popViewOperationType){
    PopViewCloseTag = 100,//关闭按钮
    PopViewTakeTag = 101,   //参与按钮

};


@interface AdPopView : UIView
@property (copy, nonatomic) void (^didSelectButtonTag)(int index);

@property (copy, nonatomic) NSString *imageName;/**<弹出图片名字*/

@property (assign, nonatomic) BOOL isDeleteBtn;/**<是否显示关闭按钮*/

@end
