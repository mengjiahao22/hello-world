//
//  ViewController.m
//  速度
//
//  Created by hdd on 16/2/22.
//  Copyright © 2016年 hdd. All rights reserved.
//

#import "ViewController.h"

#import "Countly.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    for (int i = 0; i < 5; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 100 + i*50, 100, 50);
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[NSString stringWithFormat:@"按钮%d",i+1] forState:UIControlStateNormal];
        btn.tag = i;
        [btn setBackgroundColor:[UIColor redColor]];
        
        [self.view addSubview:btn];
    }
    
    UIButton *viewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    viewBtn.frame = CGRectMake(100, 400, 100, 50);
    [viewBtn setTitle:@"页面跳转" forState:UIControlStateNormal];
    [viewBtn addTarget:self action:@selector(viewChange) forControlEvents:UIControlEventTouchUpInside];
    [viewBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:viewBtn];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(100, 450, 100, 50);
    [closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [closeBtn setTitle:@"关闭会话" forState:UIControlStateNormal];
    [closeBtn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:closeBtn];
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(100, 500, 100, 50);
    [startBtn addTarget:self action:@selector(startBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [startBtn setTitle:@"开启会话" forState:UIControlStateNormal];
    [startBtn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:startBtn];
}


- (void)btnAction:(UIButton *)btn {
    
    NSInteger index = btn.tag;
    
    NSString *key = [NSString stringWithFormat:@"button-click%ld",index];
    
    [Countly.sharedInstance recordEvent:key count:1];
}

- (void)viewChange {
    
    [[Countly sharedInstance] recordEvent:@"页面跳转" segmentation:@{@"name":@"首页",@"time":@(time(NULL))} count:1];
}


- (void)startBtnAction {
    
    [[Countly sharedInstance] onResume];
}

- (void)closeBtnAction {
    
    [[Countly sharedInstance] onPause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
