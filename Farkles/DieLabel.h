//
//  DieLabel.h
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dice.h"

// define protocol
@protocol DieLabelDelegate <NSObject>

// declare method in our protocol
-(void)dieWasTapped:(UILabel *)dieLabel;

@end

@interface DieLabel : UILabel

@property Dice *dice;

@property Dice *die1;
@property Dice *die2;
@property Dice *die3;
@property Dice *die4;
@property Dice *die5;
@property Dice *die6;

@property NSTimer *randomTimer;
@property int randomInt;
@property int randomDice;
@property NSArray *blueDiceArray;
@property NSArray *greenDiceArray;
@property NSArray *diceArray;

@property BOOL dieSelected;
@property BOOL rollFinished;

// declare property that specifies protocol
@property (weak, nonatomic) id <DieLabelDelegate> delegate;

-(void)roll:(id)sender;

@end