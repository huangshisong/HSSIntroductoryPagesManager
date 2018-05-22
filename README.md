# HSSIntroductoryPagesManager
启动图片引导页
使用方法  在AppDelegate中导入
    - #import "HSSIntroductoryPagesManager.h"
然后在
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    中 使用一下方法
    [HSSIntroductoryPagesManager showIntroductoryPageView:@[@"intro_0.jpg",@"intro_1.jpg",@"intro_2.jpg",@"intro_3.jpg"]];
    后面数组是本地图片
