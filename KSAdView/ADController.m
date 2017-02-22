//
//  ADController.m
//  KSAdView
//
//  Created by 康帅 on 17/2/22.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import "ADController.h"

@interface ADController ()

@end

@implementation ADController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.backgroundColor = [UIColor whiteColor];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.reqUrl]];
    [webView loadRequest:request];
    [self.view addSubview:webView];
}
-(void)PersonBackBtnClick:(UIButton *)send{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
