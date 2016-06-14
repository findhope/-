//
//  ZHYMainNavController.m
//  SunalliesTest
//
//  Created by MitnickKevin on 16/6/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMainNavController.h"

@interface ZHYMainNavController () <UIGestureRecognizerDelegate>
/** 左上角返回按钮 */
@property (weak, nonatomic) UIButton * backButton;

@end

@implementation ZHYMainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

+ (void)initialize {
    /** 设置UINavigationbar */
    UINavigationBar * NavBar = [UINavigationBar appearance];
    [NavBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    // 设置标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [NavBar setTitleTextAttributes:barAttrs];
    // 设置UIBarButtonItem
    UIBarButtonItem * item = [UIBarButtonItem appearance];
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    NSMutableDictionary * disabledAttrs = [NSMutableDictionary dictionary];
    disabledAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disabledAttrs forState:UIControlStateDisabled];
}

- (void)setupNavPopButton {
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    NSAttributedString *normalAttrsString = [[NSAttributedString alloc] initWithString:@"返回" attributes:normalAttrs];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [backButton setAttributedTitle:normalAttrsString forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
    [backButton sizeToFit];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [self.view addSubview:backButton];
    self.backButton = backButton;
}

- (void)backButtonClick {
    [self popViewControllerAnimated:YES];
}

/**
 *  设置返回按钮触发手势
 */
- (void)setupNavigation {
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count >= 1) {
        [self setupNavPopButton];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.childViewControllers.count > 1;
}
@end
