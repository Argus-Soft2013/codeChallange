//
//  CCLoginViewController.h
//  codeChallange
//
//  Created by DeMoN on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "CCViewController.h"

@class CCAuthValidator;

@interface CCLoginViewController : CCViewController

@property(nonatomic, strong) CCAuthValidator *validator;

@end
