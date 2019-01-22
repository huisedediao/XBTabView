//
//  XBChooseTypeView.m
//  AnXin
//
//  Created by xxb on 2018/4/19.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "XBChooseTypeView.h"
#import "XBTabViewConfig.h"
#import "Masonry.h"

@interface XBChooseTypeView ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) NSMutableArray *arrM_btns;
@end

@implementation XBChooseTypeView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.arrM_btns = [NSMutableArray new];
        self.backgroundColor = XBTabViewColor_white;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"XBChooseTypeView销毁");
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    
    [self layoutIfNeeded];
    
    if (self.arrM_btns.count > currentIndex)
    {
        for (UIButton *btn in self.arrM_btns)
        {
            btn.selected = NO;
        }
        UIButton *btn = self.arrM_btns[currentIndex];
        btn.selected = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(kBtnWidth);
                make.height.mas_equalTo(GHeightFactorFun(1));
                make.bottom.equalTo(self);
                make.left.equalTo(btn);
            }];
            [self layoutIfNeeded];
        }];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.scrollView == nil)
    {
        if (self.btnCountForScreenWidth == 0)
        {
            self.btnCountForScreenWidth = kBtnCount;
        }
        
        self.scrollView = ({
            UIScrollView *scrollView = [UIScrollView new];
            [self addSubview:scrollView];
            [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
            scrollView.showsVerticalScrollIndicator = NO;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView;
        });
        
        self.lineView = ({
            UIView *line = [UIView new];
            [self addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(kBtnWidth);
                make.height.mas_equalTo(GHeightFactorFun(1));
                make.bottom.equalTo(self);
                make.left.mas_equalTo(0);
            }];
            line.backgroundColor = XBTabViewColor_nav;
            line;
        });
        
        UIView *lastView = nil;
        for (NSString *title in self.arr_titles)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.scrollView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                if (lastView)
                {
                    make.left.equalTo(lastView.mas_right);
                }
                else
                {
                    make.left.equalTo(self.scrollView);
                }
                make.top.equalTo(self.scrollView);
                make.width.mas_equalTo(kBtnWidth);
                make.bottom.equalTo(self.lineView.mas_top);
                if (title == self.arr_titles.lastObject)
                {
                    make.right.lessThanOrEqualTo(self.scrollView);
                }
                make.bottom.lessThanOrEqualTo(self.scrollView);
            }];
            lastView = btn;
            btn.titleLabel.font = UIFont(GHeightFactorFun(12));
            [btn setTitleColor:XBTabViewColor_black_51_51_51 forState:UIControlStateNormal];
            [btn setTitleColor:XBTabViewColor_nav forState:UIControlStateSelected];
            [btn setTitle:title forState:UIControlStateNormal];
            btn.backgroundColor = RandColor;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.arrM_btns addObject:btn];
            [btn layoutIfNeeded];
        }
        
        [self setCurrentIndex:self.currentIndex];
    }
}

- (void)btnClick:(UIButton *)btn
{
    NSInteger index = [self.arrM_btns indexOfObject:btn];
    [self setCurrentIndex:index];
    
    [self.scrollView scrollRectToVisible:btn.frame animated:YES];
    
    if (self.bl_click)
    {
        self.bl_click(index);
    }
}

@end
