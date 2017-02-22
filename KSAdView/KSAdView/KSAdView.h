//
//  KSAdView.h
//  KSAdView
//
//  Created by 康帅 on 17/2/22.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSAdView : UIView
@property(nonatomic,strong)void(^ShowAdBlock)();
/*
 ** 显示在首页
 */
-(void)show;
@end
