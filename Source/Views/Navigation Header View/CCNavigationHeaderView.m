//
//  CCNavigationHeaderView.m
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCNavigationHeaderView.h"
#import "CCNavigationHeaderView_Protected.h"

@implementation CCNavigationHeaderView

static CGFloat const CCHeaderViewSeparatorLineWidth = 0.5;

#pragma mark - View

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setupView
{
    [self setBackgroundColor:CC_WHITE_COLOR];
    
    [[self titleLabel] setFont:CC_NAVIGATION_TITLE_FONT];
    [[self titleLabel] setTextColor:CC_NAVIGATION_TITLE_COLOR];
    [self setHeaderTitle:@""];
    
    [self setLeftButtonTitle:@"" forState:UIControlStateNormal];
    [self setLeftButtonTitle:@"" forState:UIControlStateHighlighted];
    [self setLeftButtonTitle:@"" forState:UIControlStateSelected];
    [self setLeftButtonTitle:@"" forState:UIControlStateDisabled];
    
    [self setRightButtonTitle:@"" forState:UIControlStateNormal];
    [self setRightButtonTitle:@"" forState:UIControlStateHighlighted];
    [self setRightButtonTitle:@"" forState:UIControlStateSelected];
    [self setRightButtonTitle:@"" forState:UIControlStateDisabled];
    
    CALayer *separatorLayer = [CALayer layer];
    [separatorLayer setBackgroundColor:[CC_BORDER_COLOR CGColor]];
    [separatorLayer setFrame:CGRectMake(0,
                                        CGRectGetHeight([self frame]) - CCHeaderViewSeparatorLineWidth,
                                        CGRectGetWidth([self frame]),
                                        CCHeaderViewSeparatorLineWidth)];
    [[self layer] addSublayer:separatorLayer];
    [self setSeparatorLayer:separatorLayer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [[self separatorLayer] setFrame:CGRectMake(0,
                                               CGRectGetHeight([self frame]) - CCHeaderViewSeparatorLineWidth,
                                               CGRectGetWidth([self frame]),
                                               CCHeaderViewSeparatorLineWidth)];
}

- (void)setBackgroundColor:(UIColor *)theBackgroundColor
{
    [super setBackgroundColor:theBackgroundColor];
    [[self titleLabel] setBackgroundColor:theBackgroundColor];
    [[self leftButton] setBackgroundColor:theBackgroundColor];
    [[self rightButton] setBackgroundColor:theBackgroundColor];
}

#pragma mark - Public

- (void)setAttributedHeaderTitle:(NSAttributedString *)theTitle
{
    [[self titleLabel] setAttributedText:theTitle];
}

- (void)setLeftButtonTitle:(NSString *)theTitle forState:(UIControlState)theState
{
    [[self leftButton] setAttributedTitle:[[NSAttributedString alloc] initWithString:theTitle
                                                                          attributes:[self buttonAttributesForState:theState]]
                                 forState:theState];
}

- (void)setLeftButtonImage:(UIImage *)theImage forState:(UIControlState)theState
{
    [[self leftButton] setImage:theImage forState:theState];
}

- (void)addLeftButtonTarget:(id)theTarget selector:(SEL)theSelector forControlEvents:(UIControlEvents)theEvents
{
    [[self leftButton] addTarget:theTarget action:theSelector forControlEvents:theEvents];
}

- (void)setRightButtonTitle:(NSString *)theTitle forState:(UIControlState)theState
{
    [[self rightButton] setAttributedTitle:[[NSAttributedString alloc] initWithString:theTitle
                                                                           attributes:[self buttonAttributesForState:theState]]
                                  forState:theState];
}

- (void)setRightButtonImage:(UIImage *)theImage forState:(UIControlState)theState
{
    [[self rightButton] setImage:theImage forState:theState];
}

- (void)addRightButtonTarget:(id)theTarget selector:(SEL)theSelector forControlEvents:(UIControlEvents)theEvents
{
    [[self rightButton] addTarget:theTarget action:theSelector forControlEvents:theEvents];
}

- (void)setRightButtonSelected:(BOOL)theSelected
{
    [[self rightButton] setSelected:theSelected];
}

- (CGRect)anchorRectToRightButton
{
    return [[self rightButton] frame];
}

#pragma mark - Protected

- (NSDictionary *)buttonAttributesForState:(UIControlState)theState
{
    NSMutableDictionary *attributes = [NSMutableDictionary dictionaryWithObject:CC_NAVIGATION_BUTTON_TEXT_FONT forKey:NSFontAttributeName];
    
    switch (theState)
    {
        case UIControlStateHighlighted:
        {
            [attributes setObject:CC_NAVIGATION_BUTTON_HIGHLIGHTED_TEXT_COLOR forKey:NSForegroundColorAttributeName];
            
            break;
        }
        case UIControlStateDisabled:
        {
            [attributes setObject:CC_NAVIGATION_BUTTON_DISABLED_TEXT_COLOR forKey:NSForegroundColorAttributeName];
            
            break;
        }
        default:
        {
            [attributes setObject:CC_NAVIGATION_BUTTON_NORMAL_TEXT_COLOR forKey:NSForegroundColorAttributeName];
            
            break;
        }
    }
    
    return attributes;
}

#pragma mark - Getter

- (NSString *)headerTitle
{
    return [[self titleLabel] text];
}

#pragma mark - Setter

- (void)setHeaderTitle:(NSString *)theHeaderTitle
{
    [[self titleLabel] setText:theHeaderTitle];
}

- (void)setLeftButtonVisible:(BOOL)theLeftButtonVisible
{
    _leftButtonVisible = theLeftButtonVisible;
    [[self leftButton] setHidden:!theLeftButtonVisible];
}

- (void)setRightButtonVisible:(BOOL)theRightButtonVisible
{
    _rightButtonVisible = theRightButtonVisible;
    [[self rightButton] setHidden:!theRightButtonVisible];
}

@end
