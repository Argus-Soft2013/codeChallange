//
//  CCDashboardTableViewCell.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCTableViewCell.h"

@class CCDashboardViewModel;

@interface CCDashboardTableViewCell : CCTableViewCell

+ (CGFloat)itemHeightWithViewModel:(CCDashboardViewModel *)theViewModel inWidth:(CGFloat)theWidth;
- (void)setViewModel:(CCDashboardViewModel *)theViewModel;

@end
