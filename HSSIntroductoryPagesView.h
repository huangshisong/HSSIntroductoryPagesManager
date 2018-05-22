//
//  HSSIntroductoryPagesView.h
//  HSSIntroductoryPagesManager
//
//  Created by 和系 on 2018/4/25.
//

#import <UIKit/UIKit.h>
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height //主屏幕的高度
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width  //主屏幕的宽度
@interface HSSIntroductoryPagesView : UIView
+ (instancetype)pagesViewWithFrame:(CGRect)frame images:(NSArray<NSString *> *)images;
@end
