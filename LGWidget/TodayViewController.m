//
//  TodayViewController.m
//  LGWidget
//
//  Created by hzx on 2018/8/16.
//  Copyright © 2018年 hzx. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 60, 40)];
    [btn setTitle:@"唤醒了" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(huanXingClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    BOOL isIOS10 = [UIDevice currentDevice].systemVersion.floatValue >= 10.0;
    if (isIOS10)
    {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }
    CGFloat kWidgetWidth = [UIScreen mainScreen].bounds.size.width;
    self.preferredContentSize = CGSizeMake(kWidgetWidth, 110);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)huanXingClick:(id)sender {
    
    NSLog(@"%s",__func__);
    
//    NSURL *url = [NSURL URLWithString:@"LGWidgetDemo://red"];
//    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
//
//        NSLog(@"isSuccessed %d",success);
//    }];
    
    NSLog(@"%s",__func__);
//    QQ mqq:// 微信 weixin:// 淘宝taobao:// 微博 sinaweibo:// 支付宝alipay://
    NSURL *url = [NSURL URLWithString:@"mqq://"];
    
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        
        NSLog(@"isSuccessed %d",success);
    }];

}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {


    completionHandler(NCUpdateResultNewData);
}

//重写切换展开及折叠布局时的方法（iOS10之后）
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    NSLog(@"maxWidth %f maxHeight %f",maxSize.width,maxSize.height);
    if (activeDisplayMode == NCWidgetDisplayModeCompact)
    {
        self.preferredContentSize = CGSizeMake(maxSize.width, 110);
    }
    else
    {
        self.preferredContentSize = CGSizeMake(maxSize.width, 200);
    }
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


@end
