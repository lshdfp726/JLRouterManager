//
//  AVC.m
//  JLRouterManager
//
//  Created by fns on 2017/6/26.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "AVC.h"

@interface AVC ()

@end

@implementation AVC


- (instancetype)initWithParams:(NSDictionary *)dic {
    self = [super initWithParams:dic];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        [self.view setBackgroundColor:[UIColor whiteColor]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"跳转到BVC" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToVC) forControlEvents:UIControlEventTouchUpInside];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)jumpToVC {
    RouterModel *model = [[RouterModel alloc] initWithScheme:@"Manager" className:@[@"BVC"] identify:RouterParamsValue];
    [[JLRouterManager routerManager] openWithValueModel:model];
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
