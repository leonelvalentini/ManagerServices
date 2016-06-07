//
//  ManagerServices.m
//  MetroSige
//
//  Created by Leonel Valentini on 17/5/16.
//  Copyright © 2016 LDV. All rights reserved.
//

#import "ManagerServices.h"

@implementation ManagerServices

static ManagerServices *sharedInstance = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ManagerServices alloc] init];
    });
    return sharedInstance;
}

- (void) callService:(NSString*)url parameters:(id)parameters method:(NSString *)method callback:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler{
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:method URLString:url parameters:parameters error:nil];
    
    [[manager dataTaskWithRequest:req
                   uploadProgress:nil
                 downloadProgress:nil
                completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    completionHandler(response,responseObject,error);
                }] resume];
}

@end
