//
//  XBTabView.h
//  AnXin
//
//  Created by xxb on 2018/4/19.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^XBTabViewClickBtnBlock)(NSInteger index);

@interface XBTabView : UIView
@property (nonatomic,assign) NSInteger btnCountForScreenWidth;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSArray *arr_titles;
@property (nonatomic,copy) XBTabViewClickBtnBlock bl_click;
@end
