//
//  XMViewController.m
//  XMKit_EN
//
//  Created by 564057354@qq.com on 04/17/2024.
//  Copyright (c) 2024 564057354@qq.com. All rights reserved.
//

#import "XMViewController.h"
#import <XMKit_EN/XMKit.h>

@interface XMViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"主页";
    
    self.title = [[NSBundle mainBundle] infoDictionary][@"GADApplicationIdentifier"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.title = [[NSBundle mainBundle] infoDictionary][@"NSPhotoLibraryUsageDescription"];
}

@end
