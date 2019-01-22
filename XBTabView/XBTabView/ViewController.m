//
//  ViewController.m
//  XBTabView
//
//  Created by xxb on 2019/1/22.
//  Copyright © 2019年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "XBChooseTypeView.h"

@interface ViewController ()
@property (nonatomic,strong) UIView *testView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XBChooseTypeView *view = [XBChooseTypeView new];
    [self.view addSubview:view];
    view.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50);
    view.arr_titles = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    view.bl_click = ^(NSInteger index) {
        NSLog(@"%ld",index);
    };
    view.backgroundColor = [UIColor orangeColor];
    self.testView = view;
}


@end
