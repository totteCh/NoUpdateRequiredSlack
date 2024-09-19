#import <Foundation/Foundation.h>

%hook NSURLSession

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSMutableURLRequest *)request completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler {
    NSString *userAgent = [request valueForHTTPHeaderField:@"User-Agent"];
    if ([userAgent hasPrefix:@"com.tinyspeck.chatlyio"]) {
        [request setValue:@"com.tinyspeck.chatlyio/24.98.30 (iPhone; iOS 18.0; Scale/3.00)" forHTTPHeaderField:@"User-Agent"];
    }

    return %orig;
}

%end
