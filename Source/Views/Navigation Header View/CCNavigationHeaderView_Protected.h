//
//  CCNavigationHeaderView_Protected.h
//  codeChallange
//
//  Created by DeMoN on 5/26/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCNavigationHeaderView.h"
#import "CCButton.h"

@interface CCNavigationHeaderView ()

@property(nonatomic, strong) IBOutlet UILabel *titleLabel;

@property(nonatomic, strong) IBOutlet UIButton *leftButton;
@property(nonatomic, strong) IBOutlet UIButton *rightButton;

@property(nonatomic, strong) CALayer *separatorLayer;

- (void)setupView;
- (NSDictionary *)buttonAttributesForState:(UIControlState)theState;

@end
