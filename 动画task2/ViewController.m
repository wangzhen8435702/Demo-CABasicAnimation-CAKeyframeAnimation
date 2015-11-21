//
//  ViewController.m
//  动画task2
//
//  Created by wangzhen on 15-1-28.
//  Copyright (c) 2015年 wangzhen. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MenuView* rightViw=[[MenuView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-180, self.view.frame.size.height-180,180 , 180) state:MenuStateRight block:^(NSInteger index, MenuView *view) {
        NSLog(@"%ld",index);
    }];
    [rightViw setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:rightViw];
    
    MenuView* leftView=[[MenuView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-180,180 , 180) state:MenuStateLeft block:^(NSInteger index, MenuView *view) {
        NSLog(@"%ld",index);
    }];
    [leftView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:leftView];
    
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
