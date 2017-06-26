//
//  RouterModel.m
//  UsualTest
//
//  Created by fns on 2017/6/21.
//  Copyright © 2017年 fns. All rights reserved.
//

#import "RouterModel.h"

@interface RouterModel () 

@end

@implementation RouterModel
- (instancetype)initWithScheme:(NSString *)scheme className:(NSArray *)className identify:(KeyAndValue)identify {
    self = [super init];
    if (self) {
        _scheme    = scheme;
        _className = className;
        _identify  = identify;
        switch (identify) {
            case 0:
                [self joinParamsKey];
                break;
            case 1:
                [self joinParamsValue];
                break;
            default:
                break;
        }
    }
    return self;
}


- (void)joinParamsKey {
    if (_className.count == 0) {
        NSLog(@"缺少跳转的路径名称");
        return;
    }
    
    __block NSString *pathUrl = @"";
    [_className enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.length !=0) {
            pathUrl = [pathUrl stringByAppendingFormat:@"/:%@",obj];
        }
    }];
    _pathUrl = pathUrl;
}


- (void)joinParamsValue {
    if (_className.count == 0) {
        NSLog(@"缺少跳转的路径名称");
        return;
    }
    
    __block NSString *pathUrl = @"";
    [_className enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.length !=0) {
            pathUrl = [pathUrl stringByAppendingFormat:@"/%@",obj];
        }
    }];
    
    if ([pathUrl hasPrefix:@"/"]) {//去掉头部的:/
        pathUrl = [pathUrl substringFromIndex:1];
    }
    _pathUrl = pathUrl;
    
    if ([_scheme containsString:@"://"]) {
        _pathUrl = [_scheme stringByAppendingString:_pathUrl];
    } else {
        _scheme  = [_scheme stringByAppendingString:@"://"];
        _pathUrl = [_scheme stringByAppendingString:_pathUrl];
    }

}



@end
