//
//  Dice.h
//  Farkles
//
//  Created by Matt Deuschle on 1/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Dice : NSObject

@property int dieInt;
@property UIColor *greenLabel;
@property UIColor *blueLabel;

-(instancetype)initWithFullLabels:(int)dieInt andGreenLabel:(UIColor *)greenLabel andBlueLabel:(UIColor *)blueLabel;

@end
