//
//  MDXAppDelegate.m
//  CaptiveNetworkTest
//
//  Created by Simon Maddox on 30/07/2014.
//  Copyright (c) 2014 Maddox Ltd. All rights reserved.
//

#import "MDXAppDelegate.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation MDXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	CFArrayRef networkInterfaces = CNCopySupportedInterfaces();
	
	CFStringRef firstNetworkInterface =  CFArrayGetValueAtIndex(networkInterfaces, 0);
	
	CFDictionaryRef networkInfo = CNCopyCurrentNetworkInfo(firstNetworkInterface);
	if (networkInfo){
		NSLog(@"%@", networkInfo);
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Network SSID" message:[(__bridge NSDictionary *)networkInfo objectForKey:@"SSID"] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
		[alert show];
		
		CFRelease(networkInfo);
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Not on wifi?" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
		[alert show];
	}
	
	CFRelease(networkInterfaces);
	
    return YES;
}

@end
