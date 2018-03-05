//
//  ViewController.m
//  LGW_AppStoreGrade
//
//  Created by Lilong on 2018/3/5.
//  Copyright © 2018年 第七代目. All rights reserved.
//

#import "ViewController.h"

#import <StoreKit/StoreKit.h>
@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)systemComentAction:(id)sender {
    //跳出应用,跳转到AppStore,进行评分
    NSString *APPID = @"1307852114";
    NSString *appStoreReviewStr = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",APPID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appStoreReviewStr] options:@{} completionHandler:^(BOOL success) {
        NSLog(@"打开了");
    }];
}

- (IBAction)systemComent2Action:(id)sender {
    NSString *APPID = @"1307852114";
    // 初始化控制器
    SKStoreProductViewController *storeProductViewContorller = [[SKStoreProductViewController alloc] init];
    // 设置代理请求为当前控制器本身
    storeProductViewContorller.delegate = self;
    [storeProductViewContorller loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:APPID} completionBlock:^(BOOL result, NSError * _Nullable error) {
        if(error)  {
            NSLog(@"error %@ with userInfo %@",error,[error userInfo]);
        }else{
            // 模态弹出appstor
            [self presentViewController:storeProductViewContorller animated:YES completion:^{
                
            }];
        }
    }];

}

//AppStore取消按钮监听

- (void)productViewControllerDidFinish:(SKStoreProductViewController*)viewController{
//    [selfdismissViewControllerAnimated:YEScompletion:nil];
}



- (IBAction)systemComent3Action:(id)sender {
    //仅支持iOS10.3+（需要做校验） 且每个APP内每年最多弹出3次评分alart
    if([SKStoreReviewController respondsToSelector:@selector(requestReview)]) {
        //防止键盘遮挡
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        [SKStoreReviewController requestReview];
    } else {
        //不论iOS 版本均可使用APP内部打开网页形式，跳转到App Store 直接编辑评论
        NSString *APPID = @"1307852114";
        NSString *nsStringToOpen = [NSString stringWithFormat: @"itms-apps://itunes.apple.com/app/id%@?action=write-review",APPID];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:nsStringToOpen] options:@{} completionHandler:^(BOOL success) {
            
        }];
    }
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
