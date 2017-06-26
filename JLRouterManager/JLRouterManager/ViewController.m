//
//  ViewController.m
//  JLRouterManager
//
//  Created by fns on 2017/6/26.
//  Copyright © 2017年 lsh726. All rights reserved.
//

#import "ViewController.h"
#import "AVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
}


- (IBAction)Jump:(id)sender {
    RouterModel *model = [[RouterModel alloc] initWithScheme:@"Manager" className:@[@"AVC"] identify:RouterParamsValue];
    [[JLRouterManager routerManager] openWithValueModel:model];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
