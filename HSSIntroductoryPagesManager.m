//
//  HSSIntroductoryPagesManager.m
//  HSSIntroductoryPagesManager
//
//  Created by 和系 on 2018/4/25.
//

#import "HSSIntroductoryPagesManager.h"
#import "HSSIntroductoryPagesView.h"

@interface HSSIntroductoryPagesManager ()
@property (nonatomic,weak)UIWindow * curWindow;
@property (nonatomic,strong)HSSIntroductoryPagesView * curIntroductoryPagesView;
@end


@implementation HSSIntroductoryPagesManager
static HSSIntroductoryPagesManager * shareInstance_ = nil;
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance_ = [[HSSIntroductoryPagesManager alloc] init];
    });
    
    return shareInstance_;
}
+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray{
    if (![HSSIntroductoryPagesManager shareInstance].curIntroductoryPagesView) {
        [HSSIntroductoryPagesManager shareInstance].curIntroductoryPagesView = [HSSIntroductoryPagesView pagesViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) images:imageArray];
    }
    [HSSIntroductoryPagesManager shareInstance].curWindow = [UIApplication sharedApplication].keyWindow;
    [[HSSIntroductoryPagesManager shareInstance].curWindow addSubview:[HSSIntroductoryPagesManager shareInstance].curIntroductoryPagesView];
}
@end
