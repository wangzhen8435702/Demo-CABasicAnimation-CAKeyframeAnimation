//
//  Item.h
//  动画task2
//
//  Created by wangzhen on 15-1-28.
//  Copyright (c) 2015年 wangzhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Item : UIButton

@property(nonatomic,assign)CGPoint startPoint;
@property(nonatomic,assign)CGPoint farPoint;
@property(nonatomic,assign)CGPoint nearPoint;
@property(nonatomic,assign)CGPoint endPoint;

-(void)spreadPosition;
-(void)inPosition;

@end
