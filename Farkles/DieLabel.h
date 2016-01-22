//
//  DieLabel.h
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <UIKit/UIKit.h>

// define protocol
@protocol DieLabelDelegate <NSObject>

// declare method in our protocol
-(void)dieWasTapped:(UILabel *)dieLabel;

@end

@interface DieLabel : UILabel

@property NSTimer *randomTimer;
@property int randomInt;
@property int randomDice;

// declare property that specifies protocol
@property (weak, nonatomic) id <DieLabelDelegate> delegate;

-(void)roll:(id)sender;

@end