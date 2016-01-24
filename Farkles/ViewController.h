//
//  ViewController.h
//  Farkles
//
//  Created by Matt Deuschle on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dice.h"
#import "DieLabel.h"
#import "GameLogic.h"

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, DieLabelDelegate>

@property Dice *dice;
@property NSArray *diceArray;

@property NSMutableArray *currentPlayingPlayers;


@end

