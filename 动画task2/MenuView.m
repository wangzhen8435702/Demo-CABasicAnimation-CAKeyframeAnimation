//
//  MenuView.m
//  动画task2
//
//  Created by wangzhen on 15-1-28.
//  Copyright (c) 2015年 wangzhen. All rights reserved.
//

#import "MenuView.h"

#define kSelfW self.frame.size.width
#define kSelfH self.frame.size.height
#define kCount 5


@implementation MenuView
-(instancetype)initWithFrame:(CGRect)frame state:(MenuState)state block:(ItemBlock)block{
    if(self==[super initWithFrame:frame]){
        _state=state;
        _block=block;
        if(state==MenuStateLeft){
            _startPoint=CGPointMake(25, kSelfH-25);
        }else if (state==MenuStateRight){
            _startPoint=CGPointMake(kSelfW-25, kSelfH-25);
        }
        
    }
    return self;
}


-(void)layoutSubviews{
    if(!mainBtn){
        [self creatbtn];
    }
    
    
    
}
-(void)creatbtn{
    
    mainBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if(_state==MenuStateLeft){
        [mainBtn setFrame:CGRectMake(0, kSelfH-50, 50, 50)];
    
    }else if (_state==MenuStateRight){
        [mainBtn setFrame:CGRectMake(kSelfW-50, kSelfH-50, 50, 50)];
    }
    
    [mainBtn setBackgroundImage:[UIImage imageNamed:@"bg-addbutton"] forState:UIControlStateNormal];
    [mainBtn setBackgroundImage:[UIImage imageNamed:@"bg-addbutton-highlighted"] forState:UIControlStateHighlighted];
    [mainBtn setImage:[UIImage imageNamed:@"icon-plus"] forState:UIControlStateNormal];
    [mainBtn setImage:[UIImage imageNamed:@"icon-plus-highlighted"] forState:UIControlStateHighlighted];
    
    [mainBtn addTarget:self action:@selector(spread) forControlEvents:UIControlEventTouchUpInside];
    
//    [self creatItem];
        [self addSubview:mainBtn];
}
-(void)creatItem{
    for(int i=0;i<kCount;i++){
        Item* btn=[Item buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"bg-menuitem"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"bg-menuitem-highlighted"] forState:UIControlStateHighlighted];
        [btn setImage:[UIImage imageNamed:@"icon-star"] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(0, 0, 40, 40)];
        btn.center=mainBtn.center;
        [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        btn.startPoint=_startPoint;
        btn.farPoint=[self itemPoint:kCount index:i radium:kSelfW-40 origin:_startPoint];
        btn.nearPoint=[self itemPoint:kCount index:i radium:kSelfW-60 origin:_startPoint];
        btn.endPoint=[self itemPoint:kCount index:i radium:kSelfW-50 origin:_startPoint];
        
        
        [btn setTag:100+i];
        
        [self addSubview:btn];
        [self bringSubviewToFront:mainBtn];
        
        
    }

}
-(void)removeItem{
    for(Item*btn in self.subviews){
        
        if([btn isKindOfClass:[Item class]]){
            [btn removeFromSuperview];
            
            
            
            }
    }
    
}


-(void)action:(UIButton*)sender{
    for(Item*btn in self.subviews){
        
        if([btn isKindOfClass:[Item class]]){
        
            if(btn.tag==sender.tag){
                [UIView animateWithDuration:.35 animations:^{
                    sender.transform=CGAffineTransformMakeScale(2, 2);
                    sender.alpha=0;
                }];
            }
            else if(btn.tag!=sender.tag){
                [UIView animateWithDuration:35 animations:^{
                    btn.alpha=0;
                    btn.transform=CGAffineTransformMakeScale(0, 0);
                    
                }];
                
            }
            
       
        }
    }
    
    _block(sender.tag-100,self);
        [self delayMethod];
    isSpread=!isSpread;
    [self performSelector:@selector(removeItem) withObject:nil afterDelay:.35];
    
    
    
}

-(void)spreadItem{
    mainBtn.enabled=NO;
    static int i=0;
    Item* btn=(Item*)[self viewWithTag:100+i];
    [btn spreadPosition];
    
    
    
    
    if(i==kCount-1){
        i=0;
        mainBtn.enabled=YES;
        return;
    }
 
    i++;
    
    [self performSelector:@selector(spreadItem) withObject:nil afterDelay:.05];


}
-(void)inItem{
    mainBtn.enabled=NO;
    
    static int i=kCount-1;
    
    Item* btn=(Item*)[self viewWithTag:100+i];
    [btn inPosition];
    
    if(i==0){
        i=kCount-1;
        mainBtn.enabled=YES;
        return;
    }
    i--;
    
    [self performSelector:@selector(inItem) withObject:nil afterDelay:.05];
}
-(void)spread{
    isSpread=!isSpread;
    if(isSpread){
        [self creatItem];
        [UIView animateWithDuration:.35 animations:^{
            mainBtn.transform=CGAffineTransformMakeRotation(M_PI_4);
        }];
        [self spreadItem];
        
       
    }
    else{
        
        
        [self inItem];
        
        
        
            [self performSelector:@selector(delayMethod) withObject:nil afterDelay:.65];
        
        
            
        
    }
    
    
}
-(void)delayMethod{
    [UIView animateWithDuration:.35 animations:^{
        
        mainBtn.transform=CGAffineTransformIdentity;

        
    }];
}


-(CGPoint)itemPoint:(int)count index:(int)index radium:(int)r origin:(CGPoint)origin{
    count=count-1;
    if(_state==MenuStateLeft){
        float _x=r*sinf(M_PI_2*index/count)+origin.x;
        float _y=origin.y-r*cosf(M_PI_2*index/count);
        return CGPointMake(_x, _y);
    }
    
    
    float _x=origin.x-r*sinf(M_PI_2*index/count);
    float _y=origin.y-r*cosf(M_PI_2*index/count);
    return CGPointMake(_x, _y);
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
