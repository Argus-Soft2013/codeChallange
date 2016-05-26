//
//  CCBaseViewController.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCViewController.h"

#import "CCAuthValidator.h"

@implementation CCViewController

#pragma mark - Public

- (BOOL)isVisible
{
    if ([self isViewLoaded] && ([[self view] window] != nil))
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - View

- (void)viewWillAppear:(BOOL)theAnimated
{
    [super viewWillAppear:theAnimated];
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.transitionCoordinator;
    
    __weak CCViewController *weakSelf = self;
    void (^ApperanceUpdateBlock)(void) = ^(void)
    {
        if ([weakSelf respondsToSelector:@selector(updateStatusBarStyleAnimated:)])
        {
            [weakSelf updateStatusBarStyleAnimated:theAnimated];
        }
        
        if ([weakSelf respondsToSelector:@selector(updateNavigationBarStyleAnimated:)])
        {
            [weakSelf updateNavigationBarStyleAnimated:theAnimated];
        }
    };
    
    if ((coordinator != nil) && [coordinator initiallyInteractive])
    {
        [coordinator notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context)
         {
             if ([context isCancelled] == NO)
             {
                 ApperanceUpdateBlock();
             }
         }];
    }
    else
    {
        ApperanceUpdateBlock();
    }
}

#pragma mark - CCStatusBarAppearanceProtocol

- (CCStatusBarStyle)preferredStatusBarAppearanceStyle
{
    return CCStatusBarStyleDefault;
}

- (void)updateStatusBarStyleAnimated:(BOOL)theAnimated
{
    UIStatusBarStyle selectedStyle = UIStatusBarStyleDefault;
    
    switch ([self preferredStatusBarAppearanceStyle])
    {
        case CCStatusBarStyleInherited:
        {
            return;
        }
        case CCStatusBarStyleDefault:
        {
            selectedStyle = UIStatusBarStyleDefault;
            break;
        }
        case CCStatusBarStyleLightContent:
        {
            selectedStyle = UIStatusBarStyleLightContent;
            break;
        }
    }
    
    if ([[UIApplication sharedApplication] statusBarStyle] != selectedStyle)
    {
        if (theAnimated)
        {
            [[UIApplication sharedApplication] setStatusBarStyle:selectedStyle animated:theAnimated];
        }
        else
        {
            [[UIApplication sharedApplication] setStatusBarStyle:selectedStyle];
        }
    }
}

#pragma mark - CCNavigationBarAppearanceProtocol

- (CCNavigationBarApperanceStyle)preferredNavigationBarAppearanceStyle
{
    return CCNavigationBarApperanceStyleVisible;
}

- (void)updateNavigationBarStyleAnimated:(BOOL)theAnimated
{
    if (([self navigationController] != nil) &&
        ([[self parentViewController] isKindOfClass:[UINavigationController class]]))
    {
        BOOL isHidden = NO;
        
        switch ([self preferredNavigationBarAppearanceStyle])
        {
            case CCNavigationBarApperanceStyleInherited:
            {
                return;
            }
            case CCNavigationBarApperanceStyleVisible:
            {
                isHidden = NO;
                
                break;
            }
            case CCNavigationBarApperanceStyleHidden:
            {
                isHidden = YES;
                
                break;
            }
        }
        
        if (theAnimated)
        {
            [[self navigationController] setNavigationBarHidden:isHidden animated:theAnimated];
        }
        else
        {
            [[self navigationController] setNavigationBarHidden:isHidden];
        }
    }
}

#pragma mark - Text Field Validator

- (BOOL)validateTextWithTextFields:(NSArray *)textFields validator:(CCAuthValidator *)validator
{
    BOOL isValidInput = YES;
    
    for (UITextField *textField in textFields)
    {
        if ([validator isEmptyString:[textField text]])
        {
            isValidInput = NO;
            
            [self setEmptyPlaceholderWithTextField:textField];
        }
    }
    
    return isValidInput;
}

- (void)setEmptyPlaceholderWithTextField:(UITextField *)textField
{
    UIColor *color = CC_TEXT_FIELD_EMPTY_TEXT_COLOR;
    [textField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:CCLocalizedString(@"TextField.empty")
                                                                        attributes:@{ NSForegroundColorAttributeName : color }]];
}


@end
