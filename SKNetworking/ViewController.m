//
//  ViewController.m
//  SKTool
//
//  Created by Sakya on 2018/5/7.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "ViewController.h"
#import "SKRequest.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(20, 300, 300, 50);
    [button addTarget:self action:@selector(clickToDownload) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)clickToDownload {
    for (int i = 1; i<=5; i++) {
        NSString *url = [NSString stringWithFormat:@"http://120.25.226.186:32812/resources/videos/minion_%02d.mp4", i];
        SKAPIBaseRequestDataModel *request = [[SKAPIBaseRequestDataModel alloc] init];
        request.urlPath = url;
        request.taskTag = url;
        request.method = DOWNLOAD;
        request.downloadPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"minion_%02d.mp4", i]];
        NSLog(@"%@",request.downloadPath);
        [SKRequestShare taskStart:request callBack:^(SKReponseModel *result) {
            NSLog(@"%@",result);
            NSLog(@"下载进度的%@",result.progress);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
