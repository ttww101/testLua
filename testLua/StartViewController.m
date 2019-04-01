//
//  ViewController.m
//  testLua
//
//  Created by Wu on 2019/3/7.
//  Copyright © 2019 Wu. All rights reserved.
//

#import "StartViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <TCBlobDownload/TCBlobDownload.h>
#import <wax/wax.h>

@interface StartViewController () <TCBlobDownloaderDelegate>

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //default setup: path, url
    NSString *homePath = [NSHomeDirectory() stringByAppendingPathComponent:@"scripts/"];
    NSString *fileName = @"UIWebView.lua";
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", homePath, fileName];
    NSString *downloadURLStr = @"https://bomiishere.github.io/UIWebView.lua";
    
    //remove orginal file
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error = nil;
    [manager removeItemAtPath:filePath error:&error];

    //setup lua load path
    setenv(LUA_PATH, [filePath UTF8String], 1);
    
    //download lua
    TCBlobDownloadManager *sharedManager = [TCBlobDownloadManager sharedInstance];
    NSURL *url = [[NSURL alloc] initWithString:downloadURLStr];
    [sharedManager startDownloadWithURL:url customPath:homePath firstResponse:^(NSURLResponse *response) {
        NSLog(@"start");
    } progress:^(uint64_t receivedLength, uint64_t totalLength, NSInteger remainingTime, float progress) {
        NSLog(@"progressing");
    } error:^(NSError *error) {
        NSLog(@"error");
    } complete:^(BOOL downloadFinished, NSString *pathToFile) {
        if (!downloadFinished) {
            //in case no file, use original file
            NSLog(@"not finished");
            const char *cfilename= [filePath UTF8String];
            wax_start((char*)cfilename, nil);
        } else {
            NSLog(@"finished at: %@", pathToFile);
            const char *cfilename= [pathToFile UTF8String];
            wax_start((char*)cfilename, nil);
        }
    }];
}

@end
