//
//  HSSIntroductoryPagesManager.h
//  HSSIntroductoryPagesManager
//
//  Created by 和系 on 2018/4/25.
//

#import <Foundation/Foundation.h>

@interface HSSIntroductoryPagesManager : NSObject
+ (instancetype)shareInstance;
+ (void)showIntroductoryPageView:(NSArray<NSString *> *)imageArray;
@end
