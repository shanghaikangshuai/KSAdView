//
//  KSAdView.m
//  KSAdView
//
//  Created by 康帅 on 17/2/22.
//  Copyright © 2017年 Bujiaxinxi. All rights reserved.
//

#import "KSAdView.h"
@interface KSAdView()
@property(nonatomic,strong)UIButton *dismiss;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)NSUInteger count;
@end

static int const delaytime=10;

@implementation KSAdView
/*
 ** 构造方法
 */
-(instancetype)init{
    self=[super init];
    if (self) {
        [self commonInit];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
/*
 ** 初始化参数
 */
-(void)commonInit{
    UIImageView *ad=[[UIImageView alloc]initWithFrame:self.frame];
    ad.image=[UIImage imageNamed:@"p3@2x"];
    ad.contentMode=UIViewContentModeScaleAspectFit;
    ad.userInteractionEnabled=YES;
    ad.clipsToBounds=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ShowAd)];
    [ad addGestureRecognizer:tap];
    [self addSubview:ad];
    
    CGFloat W=50;
    _dismiss=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-W-20, 20, W, W)];
    _dismiss.layer.cornerRadius=_dismiss.frame.size.width/2;
    _dismiss.backgroundColor=[[UIColor grayColor] colorWithAlphaComponent:0.5];
    [_dismiss addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    _dismiss.titleLabel.font=[UIFont systemFontOfSize:13];
    _dismiss.titleLabel.adjustsFontSizeToFitWidth=YES;
    [_dismiss setTitle:[NSString stringWithFormat:@"跳过%d秒",delaytime] forState:UIControlStateNormal];
    [self addSubview:_dismiss];
}
/*
 ** 显示在首页
 */
-(void)show{
    [self startTimer];
    
    //获取当前显示的窗口视图
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}
/*
 ** 倒计时计算
 */
-(void)calculateCount{
    _count--;
    [_dismiss setTitle:[NSString stringWithFormat:@"跳过%lu秒",(unsigned long)_count] forState:UIControlStateNormal];
    if (_count==0) {
        [self.timer invalidate];
        self.timer=nil;
        [self dismissSelf];
    }
}
/*
 ** 开启倒计时定时器
 */
-(void)startTimer{
    _count=delaytime;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
/*
 ** 手势监听
 */
-(void)ShowAd{
    [self dismissSelf];
    
    __weak typeof(self) weakSelf=self;
    if (weakSelf.ShowAdBlock) {
        weakSelf.ShowAdBlock();
    }
}
/*
 ** 跳过按钮点击
 */
-(void)dismissSelf{
    [UIView animateWithDuration:2.0 animations:^{
        self.alpha=0;
        self.transform=CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
#pragma 懒加载
-(NSTimer *)timer{
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(calculateCount) userInfo:nil repeats:YES];
    }
    return _timer;
}
@end
