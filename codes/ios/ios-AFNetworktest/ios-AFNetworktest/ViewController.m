//
//  ViewController.m
//  ios-AFNetworktest
//
//  Created by to-explore-future on 17/10/27.
//  Copyright © 2017年 to-explore-future. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void) status{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                /*
                 AFNetworkReachabilityStatusUnknown          = -1,
                 AFNetworkReachabilityStatusNotReachable     = 0,
                 AFNetworkReachabilityStatusReachableViaWWAN = 1,
                 AFNetworkReachabilityStatusReachableViaWiFi = 2,
                */
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"AFNetworkReachabilityStatusUnknown");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"AFNetworkReachabilityStatusNotReachable");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"AFNetworkReachabilityStatusReachableViaWWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"AFNetworkReachabilityStatusReachableViaWiFi");
                break;
                
            default:
                break;
        }
    }];
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self status];
    [self down1];
}

- (void) down2{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:@"https://github.com/to-explore-future/ZQNotes/blob/master/Res/%E4%BA%8C%E7%BB%B4%E6%95%B0%E7%BB%84%E4%B8%8D%E5%90%8C%E7%9A%84%E6%8C%87%E9%92%88%20.jpg" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"sucess-----------------------------------------------------------");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure===========================================================error = %@",error);
    }];
}

- (void) down1{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://124.239.229.47/r/a.gdown.baidu.com/data/wisegame/c60a7c10541d83cf/qianmama_46.apk?from=a1101"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        NSLog(@"File downloaded to: %@", filePath);
        
    }];
    
    [downloadTask resume];
    
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
