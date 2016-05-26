//
//  CCTableViewCell.m
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCTableViewCell.h"

@implementation CCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)theStyle reuseIdentifier:(NSString *)theReuseIdentifier
{
    self = [super initWithStyle:theStyle reuseIdentifier:theReuseIdentifier];
    
    if (self != nil)
    {
        [self updateAutoresizing];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self updateAutoresizing];
}

- (void)updateAutoresizing
{
    [[self contentView] setFrame:[self bounds]];
    [[self contentView] setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
}

@end
