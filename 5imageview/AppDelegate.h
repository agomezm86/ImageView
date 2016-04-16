//
//  AppDelegate.h
//  5ImageView
//
//  Created by Alejandro Gomez on 19/12/13.
//  Copyright (c) 2013 Intergrupo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)updateUserDefaults:(NSString *)key withObject:(NSString *)object;

@end
