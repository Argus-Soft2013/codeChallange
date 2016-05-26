//
//  CCButton.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCButton.h"

@implementation CCButton

#pragma mark - Autolayout

- (CGSize)intrinsicContentSize
{
    CGSize size = [super intrinsicContentSize];
    
    return CGSizeMake(size.width + [self titleEdgeInsets].left + [self titleEdgeInsets].right,
                      size.height + [self titleEdgeInsets].top + [self titleEdgeInsets].bottom);
}

@end
