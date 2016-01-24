//
//  Dice.m
//  Farkles
//
//  Created by Matt Deuschle on 1/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "Dice.h"
#import <UIKit/UIKit.h>

@implementation Dice

-(instancetype)initWithFullLabels:(int)dieInt andGreenLabel:(UIColor *)greenLabel andBlueLabel:(UIColor *)blueLabel
{
    self = [super init];
    if (self) {
        self.dieInt = dieInt;
        self.greenLabel = greenLabel;
        self.blueLabel = blueLabel;
    }
    return self;
}

-(instancetype)init {
    if (self = [super init]) {
        _isBlocked = NO;
        _dieValue  = @"1";
        _hasBeenBlocked = NO;
    }
    return self;
}

-(void)rollDie {
    
    if (!self.isBlocked) {
        int randomNumber = arc4random_uniform(6) + 1;
        self.dieValue = [NSString stringWithFormat:@"%i", randomNumber];
    } else {
        self.hasBeenBlocked = YES;
    }
}

@end
