//
//  ViewController.m
//  UITextViewHolderDemo
//
//  Created by bwrc on 16/11/18.
//  Copyright © 2016年 bwrc. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+placeHolder.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        UITextView *tv = [[UITextView alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width-200, 50)];
        tv.backgroundColor = [UIColor whiteColor];
        tv.layer.borderColor = [UIColor redColor].CGColor;
        tv.layer.borderWidth = 1.0;
        tv.placeHolder = @"placeHolder";
        tv;
    })];
    
}

@end
