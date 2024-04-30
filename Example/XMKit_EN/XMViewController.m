//
//  XMViewController.m
//  XMKit_EN
//
//  Created by 564057354@qq.com on 04/17/2024.
//  Copyright (c) 2024 564057354@qq.com. All rights reserved.
//

#import "XMViewController.h"
#import "Config.h"

@interface XMViewController ()<XMDelegate>

@property (nonatomic, copy) NSArray *list;

@end

@implementation XMViewController

- (BOOL)prefersHomeIndicatorAutoHidden {
    return true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xxx"];
        cell.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    }
    
    cell.textLabel.text = self.list[indexPath.row];
    return cell;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    self.list = @[
        @"初始化",
        @"登录",
        @"上传角色",
        
        @"支付",
        @"登出",
        @"上报事件",
        
        @"浏览器打开链接",
        @"打开客服页面",
        @"打开绑定页面",
        
        @"系统分享",
        @"系统内部评论",
        @"播放广告",
        @"广告测试",
    ];
    
    // 检查网络 监听 网络变化就有回调
    [XMManager sdkCheckNet:^(NetStatus status) {
        
    }];
    
    [self sdk_init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0: [self sdk_init];
            break;
        case 1: [self login];
            break;
        case 2: [self submit];
            break;
        case 3: [self psy];
            break;
        case 4: [self logout];
            break;
        case 5: [self event];
            break;
        case 6: [self openUrl];
            break;
        case 7: [self server];
            break;
        case 8: [self bind];
            break;
        case 9: [self share];
            break;
        case 10: [self requestReview];
            break;
        case 11: [self showAd];
            break;
        case 12: [self adTest];
            break;
        default:
            break;
    }
}

/// 初始化
- (void)sdk_init{
    
    // 初始化
    [XMManager sdkInitWithDelegate:self];
}

/// 初始化回调
- (void)sdkInitResult:(BOOL)flag{
    NSLog(@"sdkInitResult = %d",flag);
    if (flag) {
        
    }
}

/// 登录
- (void)login{
    [XMManager sdkLoginWithAutomatic:true];
    
}

/// 登录回调
- (void)sdkLoginResult:(BOOL)flag userID:(NSString *)userID userName:(NSString *)userName session:(NSString *)session isBind:(BOOL)isBind{
    
    NSLog(@"sdkLoginResult = %d",flag);
    if (flag) {
        NSLog(@"userID = %@, userName = %@, session = %@",userID,userName,session);

    }
}

/// 角色上传
- (void)submit{
    
    // 上传角色
    XMInfos *info = [XMInfos sharedXMInfos];
    
    info.roleName  = @"Paul";
    info.roleID = @"9527";

    info.roleLevel  = @"3";
    info.psyLevel = @"2";
    
    info.serverName  = @"区服2";
    info.serverID = @"12345678";
    
    [XMManager sdkSubmitRole:info];
}

/// 上传角色回调
- (void)sdkSubmitRoleResult:(BOOL)flag{
    NSLog(@"sdkSubmitRoleResult = %d",flag);
}

/// 支付
- (void)psy{
    
    XMInfos *info = [XMInfos sharedXMInfos];
    
    // 角色信息
    info.roleName  = @"Paul";
    info.roleID = @"9527";

    info.roleLevel  = @"1";
    info.psyLevel = @"0";
    
    info.serverName  = @"Test";
    info.serverID = @"9778";
    
    // 订单信息
    info.cpOrder = @"2109061544210000000004239S09778";
    info.price = @"99.99";
    info.goodsID = @"com.endless.route.dm.648";
    info.goodsName = @"6480";
    info.extends = @"com.endless.route.dm.648"; // 透传参数
    info.notify = @"http://47.241.72.50:20009/pay/xmwhy_i";
    
    [XMManager sdkPsy:info];
}

/// 支付回调
- (void)sdkPsyResult:(BOOL)flag{
    
}

/// 切换账号
- (void)logout{
    [XMManager sdkLoginOutBackFlag:true];
}

/// 登出回调
- (void)sdkLoginOutResult:(BOOL)flag{
    
    [XMManager sdkLoginWithAutomatic:false];
}

/// 上报事件 更多时间参考XMManager.h文件
- (void)event{
    [XMManager uploadEvent:@"事件名" jsonStr:@"json 字符串"];
}

/// 浏览器打开链接
- (void)openUrl{
    [XMManager sdkOpenUrl:@"https://www.baidu.com"];
}

/// 打开客服页面
- (void)server{
    [XMManager sdkOpenServiceView];
}

/// 打开绑定页面
- (void)bind{
    [XMManager sdkOpenBindView];
}

/// 绑定回调
- (void)sdkBindResult:(BOOL)flag{
    
    if (flag) {
        NSLog(@"绑定成功");
    }
}

/// 翻译
- (void)tran{
    [XMManager sdkTrans:@"Have you eaten yet?" lan:@"es" result:^(BOOL isSucccess, NSString * _Nonnull text) {

    }];
}

/// 系统分享
- (void)share{
//    UIImage *image = [UIImage imageNamed:@"图片"];
//    NSString *url = @"https://www.baidu.com";
    
    NSString *title = @"标题";
    
    NSString *base64 = @"base64的字符串";
    NSURL *url = [NSURL URLWithString:base64];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    [XMManager sdkShareImage:image url:@"" title:title];
}

/// 内部评论
- (void)requestReview{
    [XMManager sdkRequestReview];
}

/// 播放广告
- (void)showAd{
    [XMManager sdkShowRewardedAd];
}

/// 广告回调 广告回调 加载失败1、开始播放2、播放失败3、播放完成4、广告关闭5、发放奖励6
- (void)sdkShowRewardBack:(NSInteger)code{
    
}

/// 广告测试
- (void)adTest{
//    [XMManager sdkAdvTest];
    
//    NSURL *url = [NSURL URLWithString:@"http://www.dosear.cn/web/reset?url=baidu://"];
//    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
//        exit(0);
//    }];
    
//    [XMManager sdkAppStoreDetail];
    
//    [XMManager sdkAppStoreReview];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"XMKit_EN" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    NSString *text = [bundle infoDictionary][@"FacebookAppID"];
    NSLog(@"text = %@",text);
    
    NSString *main = [[NSBundle mainBundle] infoDictionary][@"FacebookAppID"];
    NSLog(@"main = %@",main);
}

- (void)sdkDeepLinkWithValue:(NSString *)deepLinkValue params:(NSDictionary *)params{
    NSString *msg = [NSString stringWithFormat:@"sdkDeepLinkWithValue = %@", deepLinkValue];
    [XMManager showMsg:msg];
}


// applinks:deeplinkna.s3.ca-central-1.amazonaws.com
// applinks:ra.onelink.me

@end

//--use-libraries --use-static-frameworks --skip-import-validation
// pod trunk push XMKit_EN.podspec --use-libraries --skip-import-validation 
