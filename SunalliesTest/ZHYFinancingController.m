//
//  ZHYFinancingController.m
//  SunalliesTest
//
//  Created by MitnickKevin on 16/6/14.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYFinancingController.h"

@interface ZHYFinancingController () <UIWebViewDelegate>

@property (weak, nonatomic) UIWebView *webView;
/** 左侧返回按钮 */
@property (weak, nonatomic) UIBarButtonItem * backButton;
@end

@implementation ZHYFinancingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupController];
}

- (void)setupController {
    self.navigationItem.title = @"光合联萌";
    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ZHYScreenW, ZHYScreenH)];
    [self.view addSubview:webView];
    self.webView = webView;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:ZHYRequestURL]]];
    self.webView.delegate = self;
    // 只需要修改此处属性即可
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    // 左侧导航返回按钮
    UIBarButtonItem * backButton = [UIBarButtonItem itemWithImage:@"backarrow" highImage:nil target:self action:@selector(backButtonClick:)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.backButton = backButton;
}

- (void)backButtonClick:(UIBarButtonItem *)button {
    [self.webView goBack];
}

- (void)fowardButtonClick:(UIBarButtonItem *)button {
    [self.webView goForward];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.backButton.customView.alpha = webView.canGoBack;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
