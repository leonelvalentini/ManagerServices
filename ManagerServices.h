//
//  ManagerServices.h
//  MetroSige
//
//  Created by Leonel Valentini on 17/5/16.
//  Copyright © 2016 LDV. All rights reserved.
//

#import "AFNetworking.h"

@interface ManagerServices : NSObject

+ (nullable instancetype)sharedInstance;
- (void) callService:(nullable NSString*)url parameters:(nullable id)parameters method:(nullable NSString*)method callback:(nullable void (^)(NSURLResponse * _Nullable response, id _Nullable responseObject,  NSError * _Nullable error))completionHandler;

@end
