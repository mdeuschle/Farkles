//
//  GameLogic.m
//  Farkles
//
//  Created by Jonathan Kilgore on 1/24/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "GameLogic.h"
#import "Dice.h"

@interface GameLogic ()

@property NSMutableArray *currentRolledDiceArray;
@property NSMutableArray *userSelectedDiceArray;
@property NSMutableArray *remainingDiceArray;

@property NSMutableArray *onesArray;
@property NSMutableArray *twosArray;
@property NSMutableArray *threesArray;
@property NSMutableArray *foursArray;
@property NSMutableArray *fivesArray;
@property NSMutableArray *sixesArray;

@property int temporaryTurnScore;

@end



@implementation GameLogic

-(instancetype)initWithCurrentPlayingPlayers: (NSMutableArray *)currentPlayingPlayers{
    
    self = [super init];
    
    if (self) {
        self.currentPlayingPlayers = [currentPlayingPlayers mutableCopy];
        self.currentPlayerIndex = 0;
        self.isGameOver = NO;
        
        self.currentRolledDiceArray = [NSMutableArray new];
        
        for (int i = 0; i < 6; i++) {
            Dice *die = [Dice new];
            die.dieInt = i +1;
            
            [self.currentRolledDiceArray addObject:die];
        }
    }
    return self;
}

#pragma mark - Public methods defined in the .h file

-(void)rollDice {
    
    //Assumes that if the array of userSelected is count 6, then a fresh turn, then roll
    //otherwsie all of the rest
    self.currentTurnScore = self.changingTurnScoreWithTap;
    
    [self getRemainingDice];
    
    [self sortingThroughDice:self.remainingDiceArray];
    
    if (!self.remainingDiceArray || !self.remainingDiceArray.count) {
        [self freshTurnDiceArray];
        
        for (Dice *die in self.currentRolledDiceArray) {
            [die rollDie];
        }
    }else {
        // This should check if die value was actually changed
        [self groupingTwoFivesIntoOne];
        
        for (Dice *die in self.currentRolledDiceArray) {
            [die rollDie];
        }
    }
}

-(NSString *)dieValueAtIndex:(int)index {
    return [[self.currentRolledDiceArray objectAtIndex:index] dieValue];
    
}

-(BOOL)isDieBlockedAtIndex:(int)index {
    return [[self.currentRolledDiceArray objectAtIndex:index] isBlocked];
}

-(void)toggleBlockedDieAtIndex:(int)index {
    Dice *die = [self.currentRolledDiceArray objectAtIndex:index];
    
    die.isBlocked = !die.isBlocked;
}

//'Hot Dice', Player should get to roll again
-(BOOL) didPlayerScoreAllSixDice {
    [self getRemainingDice];
    [self sortingThroughDice:self.remainingDiceArray];
    
    if (!self.remainingDiceArray || !self.remainingDiceArray.count) {
        
        return YES;
        
    } else {
        return NO;
    }
}

//if currentscore + gamescore > 10,000 this should also break out to end the game

-(void)calcCurrentTurnScore {
    
    [self getUserSelectedDice];
    
    [self sortingThroughDice:self.userSelectedDiceArray];
    
    int multiplierForOne = [self multiplierOfTheScoreForOnesAndFives:self.onesArray];
    int multiplierForTwo = [self multiplierOfTheScoreForOthers:self.twosArray];
    int multiplierForThree = [self multiplierOfTheScoreForOthers:self.threesArray];
    int multiplierForFour = [self multiplierOfTheScoreForOthers:self.foursArray];
    int multiplierForFive = [self multiplierOfTheScoreForOnesAndFives:self.fivesArray];
    int multiplierForSixes = [self multiplierOfTheScoreForOthers:self.sixesArray];
    
    int currentOneScore = 100 * multiplierForOne;
    int currentTwoScore = 200 * multiplierForTwo;
    int currentThreeScore = 300 * multiplierForThree;
    int currentFourScore = 400 * multiplierForFour;
    int currentFiveScore = 50 * multiplierForFive;
    int currentSixScore = 600 * multiplierForSixes;
    
    self.temporaryTurnScore = currentOneScore + currentTwoScore +
    currentThreeScore + currentFourScore +
    currentFiveScore + currentSixScore;
    
    self.changingTurnScoreWithTap = self.currentTurnScore + self.temporaryTurnScore;

}


-(BOOL) didToggleGiveScoringCombination {
    
    [self getUserSelectedDice];
    
    [self sortingThroughDice:self.userSelectedDiceArray];
    
    if ((self.twosArray.count == 1) || (self.twosArray.count == 2) || (self.twosArray.count == 4) || (self.twosArray.count == 5) ||
        (self.threesArray.count == 1) || (self.threesArray.count == 2) || (self.threesArray.count == 4) || (self.threesArray.count == 5) ||
        (self.foursArray.count == 1) || (self.foursArray.count == 2) || (self.foursArray.count == 4) || (self.foursArray.count == 5) ||
        (self.sixesArray.count == 1) || (self.sixesArray.count == 2) || (self.sixesArray.count == 4) || (self.sixesArray.count == 5))
    {
        return NO;
    }
    
    else {
        
        return YES;
    }
}


//This checks whether if 'Yes' in the ViewController calls the 'freshturnDiceArray'
//Then that turn is over and it's the next person's turn or simply the next turn
-(BOOL)didPlayerFarkle {
    
    [self getRemainingDice];
    
    [self sortingThroughDice:self.remainingDiceArray];
    
    if (!self.remainingDiceArray || !self.remainingDiceArray.count) {
        
        return NO;
        
    } else {
        if (self.onesArray.count == 0 && self.fivesArray.count == 0 &&
            self.twosArray.count <3 && self.threesArray.count <3 &&
            self.foursArray.count <3 && self.sixesArray.count <3)
        {
            return YES;
            
        } else {
            
            return NO;
        }
    }
}

-(void)playerDidFarkle {
    self.currentTurnScore = 0;
    
    [self getToNextPlayerIndex];
    [self freshTurnDiceArray];
    
    self.temporaryTurnScore = 0;
    self.changingTurnScoreWithTap = 0;
    
}

-(void)bankPoints {
    self.currentTurnScore = self.changingTurnScoreWithTap;
    Players *player = [self.currentPlayingPlayers objectAtIndex:self.currentPlayerIndex];
    
    player.gameScore += self.currentTurnScore;
    [self.currentPlayingPlayers replaceObjectAtIndex:self.currentPlayerIndex withObject:player];
    
    if (player.gameScore > 10000) {
        self.isGameOver = YES;
    }
    
    self.currentTurnScore = 0;
    self.changingTurnScoreWithTap = 0;
    self.temporaryTurnScore = 0;
    
    [self getToNextPlayerIndex];
    [self freshTurnDiceArray];
    
}


-(void)clearGame {
    [self freshTurnDiceArray];
    
    for (Players *player in self.currentPlayingPlayers) {
        player.gameScore = 0;
    }
    
    self.isGameOver = NO;
}


#pragma mark - NonPublic Methods undefined in the .h file

-(void)getRemainingDice {
    self.remainingDiceArray = [NSMutableArray new];
    
    for (Dice *die in self.currentRolledDiceArray) {
        
        if (!die.isBlocked) {
            [self.remainingDiceArray addObject:die];
        }
    }
}

-(void)sortingThroughDice: (NSMutableArray *)array {
    
    self.onesArray = [NSMutableArray new];
    self.twosArray = [NSMutableArray new];
    self.threesArray = [NSMutableArray new];
    self.foursArray = [NSMutableArray new];
    self.fivesArray = [NSMutableArray new];
    self.sixesArray = [NSMutableArray new];

    for (Dice *die in array) {
        if ([die.dieValue isEqualToString:@"1"]) {
            [self.onesArray addObject:die];
        } else if ([die.dieValue isEqualToString:@"2"]){
            [self.twosArray addObject:die];
        } else if ([die.dieValue isEqualToString:@"3"]){
            [self.threesArray addObject:die];
        } else if ([die.dieValue isEqualToString:@"4"]){
            [self.foursArray addObject:die];
        } else if ([die.dieValue isEqualToString:@"5"]){
            [self.fivesArray addObject:die];
        } else if ([die.dieValue isEqualToString:@"6"]){
            [self.sixesArray addObject:die];
        }
    }
    
}

-(void)freshTurnDiceArray {
    for (Dice *die in self.currentRolledDiceArray) {
        die.dieValue = @"1";
        die.isBlocked = NO;
        die.hasBeenBlocked = NO;
        
        //This should not reset the dieInt because it should always be the same
    }
}

-(void)getUserSelectedDice {
    self.userSelectedDiceArray = [NSMutableArray new];
    for (Dice *die in self.currentRolledDiceArray) {
        if (die.isBlocked && !(die.hasBeenBlocked)) {
            [self.userSelectedDiceArray addObject:die];
        }
    }
}

-(void)groupingTwoFivesIntoOne {
    
    int index;
    int indexThatChangesToOne;
    [self getUserSelectedDice];
    [self sortingThroughDice:self.userSelectedDiceArray];
    
    if ((self.fivesArray.count == 2) || (self.fivesArray.count == 5)) {
        Dice *die = [self.fivesArray objectAtIndex:0];
        index = die.dieInt - 1;
        
        Dice *dieTwo = [self.fivesArray objectAtIndex:1];
        indexThatChangesToOne = dieTwo.dieInt - 1;
        
        Dice *dieNotBlocked = [self.currentRolledDiceArray objectAtIndex:index];
        dieNotBlocked.isBlocked = NO;
        
        Dice *dieToOne = [self.currentRolledDiceArray objectAtIndex:indexThatChangesToOne];
        dieToOne.dieValue = @"1";
        
        self.indexOfDieToChangeBackgroundColor = index;
        
    } else {
        
       self.indexOfDieToChangeBackgroundColor = 10;
        
        return;
    }
}

-(void)getToNextPlayerIndex{
    if ((self.currentPlayerIndex + 1) == self.currentPlayingPlayers.count) {
        self.currentPlayerIndex = 0;
    } else {
        self.currentPlayerIndex += 1;
    }
}

-(int)multiplierOfTheScoreForOnesAndFives:(NSMutableArray *)array {
    
    int multiplier;
    switch (array.count) {
        case 1:
            multiplier = 1;
            break;
        case 2:
            multiplier = 2;
            break;
        case 3:
            multiplier = 10;
            break;
        case 4:
            multiplier = 11;
            break;
        case 5:
            multiplier = 12;
            break;
        case 6:
            multiplier = 20;
            break;
            
        //multiply values can be any set number based on the total 6 cases
        
        default:
            multiplier = 0;
            break;
    }
    
    return multiplier;
}

-(int)multiplierOfTheScoreForOthers:(NSMutableArray *)array {
    if (array.count > 2 && array.count < 6) {
        return 1;
    } else if (array.count == 6) {
        return 2;
    } else {
        return 0;
    }
}


@end
