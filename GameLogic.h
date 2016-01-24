//
//  GameLogic.h
//  Farkles
//
//  Created by Jonathan Kilgore on 1/24/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Players.h"
#import "ViewController.h"

@interface GameLogic : NSObject

@property NSMutableArray *currentPlayingPlayers;

@property int currentTurnScore;
@property int currentPlayerIndex;
@property int changingTurnScoreWithTap;
@property int indexOfDieToChangeBackgroundColor;

@property BOOL isGameOver;


-(instancetype)initWithCurrentPlayingPlayers: (NSMutableArray *)currentPlayingPlayers;

-(NSString *)dieValueAtIndex:(int)index;

-(void)rollDice;
-(void)toggleBlockedDieAtIndex:(int)index;
-(void)playerDidFarkle;
-(void)bankPoints;
-(void)calcCurrentTurnScore;
-(void)clearGame;

-(BOOL)didPlayerFarkle;
-(BOOL)didToggleGiveScoringCombination;
-(BOOL)didPlayerScoreAllSixDice;
-(BOOL)isDieBlockedAtIndex:(int)index;

@end
