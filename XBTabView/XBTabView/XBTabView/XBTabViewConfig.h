//
//  XBTabViewConfig.h
//  XBTabView
//
//  Created by xxb on 2019/1/22.
//  Copyright © 2019年 xxb. All rights reserved.
//

#ifndef XBTabViewConfig_h
#define XBTabViewConfig_h


#define kBtnCount (4)
#define kBtnWidth (kScreenWidth / self.btnCountForScreenWidth)
#define XBTabViewColor_black_51_51_51                  ColorRGBA(51, 51, 51, 1)
#define XBTabViewColor_white [UIColor whiteColor]
#define XBTabViewColor_nav ColorRGBA(70, 216, 114, 1)






//RGB颜色
#define ColorRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
//随机色
#define RandColor [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0]

#define UIFont(s)            [UIFont systemFontOfSize:s]

//屏幕宽高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kConsultHeight 568.0
#define kConsultWidth 320.0

#define ScreenCondition(x) ((kScreenHeight == x) || (kScreenWidth == x))

#define isIpadScreen (ScreenCondition(480.0) ? YES : NO)
#define isIphone5Screen (ScreenCondition(568.0) ? YES : NO)
#define isIphone6Screen (ScreenCondition(667.0) ? YES : NO)
#define isIphone6PScreen (ScreenCondition(736.0) ? YES : NO)
#define isIphoneXScreen (ScreenCondition(812.0) ? YES : NO)
#define isIphoneXScreen (ScreenCondition(812.0) ? YES : NO)
#define isIphoneXROrXSMAXScreen (ScreenCondition(896.0) ? YES : NO)

#define GWidthFactor (MIN(kScreenWidth, kScreenHeight)/kConsultWidth)
#define GHeightFactor \
({\
CGFloat result = kConsultHeight;\
if (isIphoneXScreen)\
{\
result = 667/kConsultHeight;\
}\
else if (isIphoneXROrXSMAXScreen)\
{\
result = 736/kConsultHeight;\
}\
else if (isIpadScreen)\
{\
result = 568/kConsultHeight;\
}\
else\
{\
result = MAX(kScreenWidth, kScreenHeight)/kConsultHeight;\
}\
result;\
})

#define GWidthFactorFun(x) (x * GWidthFactor)
#define GHeightFactorFun(x) (x * GHeightFactor)

#endif /* XBTabViewConfig_h */
