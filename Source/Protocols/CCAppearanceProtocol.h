//
//  CCAppearanceProtocol.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCNavigationBarApperanceStyle)
{
    CCNavigationBarApperanceStyleVisible = 0,
    CCNavigationBarApperanceStyleHidden,
    CCNavigationBarApperanceStyleInherited
};

typedef NS_ENUM(NSInteger, CCTabBarApperanceStyle)
{
    CCTabBarApperanceStyleVisible = 0,
    CCTabBarApperanceStyleHidden,
    CCTabBarApperanceStyleInherited
};

typedef NS_ENUM(NSInteger, CCStatusBarStyle)
{
    CCStatusBarStyleDefault = UIStatusBarStyleDefault,
    CCStatusBarStyleLightContent = UIStatusBarStyleLightContent,
    CCStatusBarStyleInherited = 900,
};

@protocol CCNavigationBarAppearanceProtocol<NSObject>

- (CCNavigationBarApperanceStyle)preferredNavigationBarAppearanceStyle;

@optional
- (void)updateNavigationBarStyleAnimated:(BOOL)theAnimated;

@end

@protocol CCStatusBarAppearanceProtocol<NSObject>

- (CCStatusBarStyle)preferredStatusBarAppearanceStyle;

@optional
- (void)updateStatusBarStyleAnimated:(BOOL)theAnimated;

@end

@protocol CCAppearanceProtocol<CCNavigationBarAppearanceProtocol, CCStatusBarAppearanceProtocol>
@end
