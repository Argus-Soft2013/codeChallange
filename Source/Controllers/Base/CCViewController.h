//
//  CCViewController.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CCDesignDefines.h"

#import "CCAppearanceProtocol.h"

@class CCAuthValidator;

@interface CCViewController : UIViewController<CCAppearanceProtocol>

- (BOOL)isVisible;

- (BOOL)validateTextWithTextFields:(NSArray *)textFields validator:(CCAuthValidator *)validator;

@end
