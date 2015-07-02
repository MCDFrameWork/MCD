//
//  ViewController.m
//  TestLua
//
//  Created by fengxiao on 15/6/30.
//  Copyright (c) 2015年 hick. All rights reserved.
//

#import "ViewController.h"
#include "LuaBridge.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    initLuaEngine();
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
