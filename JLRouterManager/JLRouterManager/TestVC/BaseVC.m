//
//  BaseVC.m
//  UsualTest
//
//  Created by fns on 2017/6/22.
//  Copyright © 2017年 fns. All rights reserved.
//

#import "BaseVC.h"
#import "JLRoutes.h"
@interface BaseVC ()

@end

@implementation BaseVC

- (instancetype)initWithParams:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registerJLRouter];
}


#pragma mark - 注册路由
- (void)registerJLRouter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        RouterModel *model = [[RouterModel alloc] initWithScheme:@"Manager" className:@[@"vcName"] identify:RouterParamsKey];
        [[JLRouterManager routerManagerWithKeyModel:model] registerJLRouterWithParams:YES completion:nil];
    });
}


- (void)egisterJLRouter {
    [JLRoutes unregisterAllRouteSchemes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
