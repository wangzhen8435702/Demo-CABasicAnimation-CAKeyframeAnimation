//
//  MenuView.h
//  动画task2
//
//  Created by wangzhen on 15-1-28.
//  Copyright (c) 2015年 wangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
@class MenuView;
typedef     void(^ItemBlock)(NSInteger index,MenuView* view);

typedef enum {
    MenuStateLeft,
    MenuStateRight
}MenuState;

@interface MenuView : UIView
{
    UIButton* mainBtn;
    BOOL isSpread;
    CGPoint _startPoint;
    MenuState _state;
    ItemBlock _block;
    

}
-(instancetype)initWithFrame:(CGRect)frame state:(MenuState)state block:(ItemBlock)block;

@property(nonatomic,strong)NSMutableArray* itemArr;


@end
