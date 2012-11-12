//
//  WeightSliderScrollView.m
//  MonsterBench
//
//  Created by Joseph Reese on 11/5/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import "WeightSliderScrollView.h"

@interface WeightSliderScrollView ()

@property float selectedWeight;

@end

@implementation WeightSliderScrollView

@synthesize selectedWeight = _selectedWeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)observeContentOffsetHandler:(NSValue *)aContentOffset
{
    
    //subtract initial offset and then set a points to pounds ratio for optimum scrolling comfort
     _selectedWeight = (aContentOffset.CGPointValue.x-100)/20;
    
}
@end
