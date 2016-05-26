//
//  CCDesignDefines.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const CCDefaultFontNameRegular;

#pragma mark - Colors

#define CC_COLOR_RGBA(R, G, B, A) [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:A / 255.0f]
#define CC_COLOR_RGB(R, G, B) CC_COLOR_RGBA(R, G, B, 255.0f)

#define CC_WHITE_COLOR CC_COLOR_RGB(255.0, 255.0, 255.0)
#define CC_BLACK_COLOR CC_COLOR_RGB(51.0, 51.0, 51.0)
#define CC_RED_COLOR CC_COLOR_RGB(222.0, 43.0, 23.0)
#define CC_DARK_RED_COLOR CC_COLOR_RGB(145.0, 25.0, 10.0)

#define CC_BORDER_COLOR CC_COLOR_RGB(202.0f, 201.0f, 206.0f)

#pragma mark - Navigation Item

#define CC_NAVIGATION_TITLE_FONT [UIFont fontWithName:CCDefaultFontNameRegular size:20.0]
#define CC_NAVIGATION_TITLE_COLOR CC_BLACK_COLOR

#define CC_NAVIGATION_BUTTON_TEXT_FONT [UIFont fontWithName:CCDefaultFontNameRegular size:16.0f]
#define CC_NAVIGATION_BUTTON_NORMAL_TEXT_COLOR CC_RED_COLOR
#define CC_NAVIGATION_BUTTON_HIGHLIGHTED_TEXT_COLOR CC_DARK_RED_COLOR
#define CC_NAVIGATION_BUTTON_DISABLED_TEXT_COLOR CC_DARK_RED_COLOR

#pragma mark - Authorization Item

#define CC_TEXT_FIELD_EMPTY_TEXT_COLOR CC_COLOR_RGB(255.0f, 100.0f, 6.0f)
#define CC_TEXT_FIELD_PLACEHOLDER_TEXT_COLOR CC_COLOR_RGB(56.0f, 199.0f, 209.0f)
