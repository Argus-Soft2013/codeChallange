//
//  KPICell.h
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KPIEntity;

@interface KPICell : UITableViewCell

-(void)updateWithKPIEntity:(KPIEntity *)entity;

@end
