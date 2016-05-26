//
//  CCDashboardTableViewCell.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCDashboardTableViewCell.h"

#import "CCDashboardViewModel.h"

@implementation CCDashboardTableViewCell

static CGFloat const CellHeight = 55.0;

#pragma mark - Public

+ (CGFloat)itemHeightWithViewModel:(CCDashboardViewModel *)theViewModel inWidth:(CGFloat)theWidth
{
    return CellHeight;
}

- (void)setViewModel:(CCDashboardViewModel *)theViewModel
{
    [self layoutIfNeeded];
}

#pragma mark - View

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setPreservesSuperviewLayoutMargins:NO];
    [self setLayoutMargins:UIEdgeInsetsZero];
    [self setSeparatorInset:UIEdgeInsetsZero];
}

@end
