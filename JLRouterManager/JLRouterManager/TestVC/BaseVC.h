//
//  BaseVC.h
//  UsualTest
//
//  Created by fns on 2017/6/22.
//  Copyright © 2017年 fns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JLRouterManager.h"
@interface BaseVC : UIViewController
- (instancetype)initWithParams:(NSDictionary *)dic;
- (void)registerJLRouter;//注册路由
@end
