//
//  ZHYMainTabBarController.m
//  SunalliesTest
//
//  Created by MitnickKevin on 16/6/13.
//  Copyright © 2016年 SWUST. All rights reserved.
//

#import "ZHYMainTabBarController.h"
#import "ZHYMainNavController.h"
#import "ZHYFinancingController.h"
#import "ZHYCrowdfundingController.h"
#import "ZHYSafeController.h"
#import "ZHYMineController.h"

@interface ZHYMainTabBarController ()

@end

@implementation ZHYMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabbarItem];
    [self setupChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupTabbarItem {
    // UIControlStateNormal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 文字大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)setupChildViewControllers {
    [self setupChildVc:[[ZHYFinancingController alloc] init] image:@"Image-1" selectImage:@"Image-1" title:@"理财"];
    [self setupChildVc:[[ZHYCrowdfundingController alloc] init] image:@"Image-2" selectImage:@"Image-2" title:@"众筹"];
    [self setupChildVc:[[ZHYSafeController alloc] init] image:@"Image-3" selectImage:@"Image-3" title:@"安全"];
    [self setupChildVc:[[ZHYMineController alloc] init] image:@"Image-4" selectImage:@"Image-4" title:@"我的"];
    self.tabBar.hidden = YES;
}

- (void)setupChildVc:(UIViewController *)vc image:(NSString *)image selectImage:(NSString *)selectImage title:(NSString *)title{
    ZHYMainNavController * navVc = [[ZHYMainNavController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.image = [UIImage imageNamed:image];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
}

@end
