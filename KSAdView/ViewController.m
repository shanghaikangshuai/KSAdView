//
//  ViewController.m
//  KSAdView
//
//  Created by 康帅 on 17/2/22.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import "ViewController.h"
#import "KSAdView.h"
#import "ADController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    self.view.backgroundColor=[UIColor whiteColor];
    
    KSAdView *view=[[KSAdView alloc]initWithFrame:self.view.bounds];
    view.ShowAdBlock=^(){
        ADController *view=[[ADController alloc]init];
        view.title=@"百度广告页";
        view.reqUrl=@"https://www.baidu.com";
        [self.navigationController pushViewController:view animated:YES];
    };
    [view show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
