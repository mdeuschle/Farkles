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

@end
