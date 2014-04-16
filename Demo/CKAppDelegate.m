//
//  CKAppDelegate.m
//  Demo
//
//  Created by Conrad Kramer on 1/20/14.
//  Copyright (c) 2014 Conrad Kramer. All rights reserved.
//

#import "CKAppDelegate.h"
#import "NSData+FILE.h"

@implementation CKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSMutableData *mutableData = [NSMutableData data];
    FILE *stream = CKOpenData(mutableData);
    fputs("Hello World!", stream);
    fclose(stream);
    NSString *string = [[NSString alloc] initWithData:mutableData encoding:NSUTF8StringEncoding];
    NSAssert([string isEqualToString:@"Hello World!"], @"The data doesn't have what it should");
    NSLog(@"%@", string);

    NSData *data = [mutableData copy];
    stream = CKOpenData(data);
    NSAssert(fputs("Test", stream) == EOF, @"I was able to write to immutable data");
    fclose(stream);

    return YES;
}


@end
