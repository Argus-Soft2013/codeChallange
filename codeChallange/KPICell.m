//
//  KPICell.m
//  codeChallange
//
//  Created by Dima Krasulya on 5/25/16.
//  Copyright © 2016 Argus Soft. All rights reserved.
//

#import "KPICell.h"
#import "KPIEntity.h"
#import "KPIValue.h"
#import "KPISurroundingPeriodData.h"
#import "KPITimePeriod.h"
#import "BIZSliderView.h"
#import "KPICurrency.h"

@interface KPICell ()<BIZSliderViewDelegate>
{
    KPIEntity *_entity;
    __weak IBOutlet UIView *_ghapthView;
    __weak IBOutlet UILabel *_nameLable;
    __weak IBOutlet UILabel *_selectedTimePeriodLabel;
    __weak IBOutlet UILabel *_valueLable;
    BIZSliderView *sliderView;
}
@end

@implementation KPICell

-(void)updateWithKPIEntity:(KPIEntity *)entity
{
    _entity = entity;
    [self configurateGraphView];
    _nameLable.text = entity.label;
    _valueLable.text = [NSString stringWithFormat:@"%@ %@", _entity.kpiValue.amountInAggregationCurrency.value, _entity.kpiValue.amountInAggregationCurrency.unit];
    _selectedTimePeriodLabel.text = [NSString stringWithFormat:@"last %@ %@",_entity.kpiValue.timePeriod.sliceUnitCount, _entity.kpiValue.timePeriod.sliceUnit];
}


//==============================================================================


-(void)configurateGraphView
{
    [sliderView removeFromSuperview];
    sliderView = nil;
    sliderView = [[BIZSliderView alloc] initWithFrame:CGRectMake(self.bounds.size.width * 0.025, 25, self.bounds.size.width * 0.95, 60)];
    sliderView.userInteractionEnabled = NO;
    [sliderView setActiveColor:[UIColor greenColor] inactiveColor:[UIColor redColor] handlerColor:[UIColor greenColor] borderColor:[UIColor lightGrayColor]];
    sliderView.backgroundColor = [UIColor clearColor];
    sliderView.minValue = _entity.surroundingPeriodData.minValue.amountInAggregationCurrency.value.floatValue;
    sliderView.maxValue = _entity.surroundingPeriodData.maxValue.amountInAggregationCurrency.value.floatValue;
    NSUInteger current = _entity.surroundingPeriodData.avgValue.amountInAggregationCurrency.value.floatValue;
    [sliderView setValue:current animated:NO];
    sliderView.sign = @"";
    sliderView.sliderTracker.arrowBackgroundColor = [UIColor redColor];
    [_ghapthView addSubview:sliderView];
    [_ghapthView bringSubviewToFront:sliderView];
}


//==============================================================================


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self configurateGraphView];
}




@end
