//
//  CCNavigationHeaderView.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCView.h"

@interface CCNavigationHeaderView : CCView

@property(nonatomic, copy)  NSString *headerTitle;
@property(nonatomic, assign) BOOL leftButtonVisible;
@property(nonatomic, assign) BOOL rightButtonVisible;

- (void)setAttributedHeaderTitle:(NSAttributedString *)theTitle;

- (void)setLeftButtonTitle:(NSString *)theTitle forState:(UIControlState)theState;
- (void)setLeftButtonImage:(UIImage *)theImage forState:(UIControlState)theState;
- (void)addLeftButtonTarget:(id)theTarget
                   selector:(SEL)theSelector
           forControlEvents:(UIControlEvents)theEvents;

- (void)setRightButtonTitle:(NSString *)theTitle forState:(UIControlState)theState;
- (void)setRightButtonImage:(UIImage *)theImage forState:(UIControlState)theState;
- (void)addRightButtonTarget:(id)theTarget
                    selector:(SEL)theSelector
            forControlEvents:(UIControlEvents)theEvents;
- (void)setRightButtonSelected:(BOOL)theSelected;

- (CGRect)anchorRectToRightButton;

@end
