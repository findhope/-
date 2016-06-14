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
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.webView.delegate = self;
    self.tabBarController.tabBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
