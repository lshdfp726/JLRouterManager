//
//  JLRouterManager.m
//  UsualTest
//
//  Created by fns on 2017/6/21.
//  Copyright © 2017年 fns. All rights reserved.
//

#import "JLRouterManager.h"

@interface JLRouterManager () {
    RouterModel *_keyModel;
    RouterModel *_valueModel;
    
}

@end

@implementation JLRouterManager

+ (instancetype)routerManagerWithKeyModel:(RouterModel *)model {
    return [[[self class] alloc] initWithKeyModel:model];
}


- (instancetype)initWithKeyModel:(RouterModel *)model {
    self = [super init];
    if (self) {
        _keyModel = model;
    }
    return self;
}


+ (instancetype)routerManager {
    return [[[self class] alloc] initWithKeyModel:nil];
}


- (void)registerJLRouterWithParams:(BOOL)hasParams completion:(void (^ __nullable)(void))completion {
    if (_keyModel.identify == RouterParamsValue) {
        NSLog(@"keyModel 设置成了ValuelModel!");
        return;
    }
    JLRoutes *routes = [JLRoutes routesForScheme:_keyModel.scheme];
    [routes addRoute:_keyModel.pathUrl handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSString *vcName = parameters[_keyModel.className[0]];
        Class class = NSClassFromString(vcName);
        BaseVC *destionVC  = nil;
        if (hasParams) {
            destionVC = [[class alloc] initWithParams:parameters];
        } else {
            destionVC = [[class alloc] init];
        }
        
        //寻找当前窗口的VC
        BaseVC *currentVC = (BaseVC *)[UIViewController currentViewController];
        
        if ([[parameters allKeys] containsObject:@"pushMethod"]) {
            NSString * pushMethod = parameters[@"pushMethod"];//约定好的字段！
            if ([pushMethod integerValue] == Push) {
                [currentVC.navigationController pushViewController:destionVC animated:YES];
            } else if ([pushMethod integerValue] == Present) {
                [currentVC presentViewController:destionVC animated:YES completion:completion];
            }
        } else {
                [currentVC.navigationController pushViewController:destionVC animated:YES];
        }
       
        return YES;
    }];
}


- (void)openWithValueModel:(RouterModel *)model {
    _valueModel = model;
    NSString *urlStr = _valueModel.pathUrl;
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];//允许scheme url 拼接参数！
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:^(BOOL success) {
        
    }];

}


@end
