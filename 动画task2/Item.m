//
//  Item.m
//  动画task2
//
//  Created by wangzhen on 15-1-28.
//  Copyright (c) 2015年 wangzhen. All rights reserved.
//

#import "Item.h"

@implementation Item



-(void)spreadPosition{
    CABasicAnimation* animation1=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation1 setToValue:[NSNumber numberWithFloat:M_PI]];
    animation1.duration=0.8;
    animation1.fillMode=kCAFillModeForwards;
    [self.layer addAnimation:animation1 forKey:nil];
    
    
    CAKeyframeAnimation* animation2=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.duration=1;
    NSValue* value1=[NSValue valueWithCGPoint:_startPoint];
    NSValue* value2=[NSValue valueWithCGPoint:_farPoint];
    NSValue* value3=[NSValue valueWithCGPoint:_nearPoint];
    NSValue* value4=[NSValue valueWithCGPoint:_endPoint];
    
    animation2.values=@[value1,value2,value3,value4];
    animation2.fillMode=kCAFillModeForwards;
    [self.layer addAnimation:animation2 forKey:nil];
    self.center=self.endPoint;
    
}
-(void)inPosition{
    CABasicAnimation* animation1=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [animation1 setToValue:[NSNumber numberWithFloat:-M_PI]];
    animation1.duration=0.8;
    animation1.fillMode=kCAFillModeForwards;
    [self.layer addAnimation:animation1 forKey:nil];
    
    
    CAKeyframeAnimation* animation2=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation2.duration=1;
    NSValue* value1=[NSValue valueWithCGPoint:_startPoint];
    NSValue* value2=[NSValue valueWithCGPoint:_farPoint];
    NSValue* value3=[NSValue valueWithCGPoint:_nearPoint];
    NSValue* value4=[NSValue valueWithCGPoint:_endPoint];
    
    animation2.values=@[value4,value2,value1];
    animation2.fillMode=kCAFillModeForwards;
    [self.layer addAnimation:animation2 forKey:nil];
    self.center=self.startPoint;
    

}



@end
