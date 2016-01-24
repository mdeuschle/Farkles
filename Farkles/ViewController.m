//
//  ViewController.m
//  Farkles
//
//  Created by Matt Deuschle on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () //<UIGestureRecognizerDelegate, DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieOneLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieTwoLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieThreeLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieFourLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieFiveLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieSixLabel;

@property (strong, nonatomic) IBOutlet DieLabel *playerOneScore;
@property (strong, nonatomic) IBOutlet DieLabel *playerTwoScore;
@property (strong, nonatomic) IBOutlet DieLabel *playerOneLabel;
@property (strong, nonatomic) IBOutlet DieLabel *playerTwoLabel;
@property NSMutableArray *originalDiceArray;
@property NSMutableArray *updatedDiceArray;

@property int scoreInt;
@property int turnInt;
@property int playerInt;
@property NSArray *diceLabelsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.playerInt = 1;
    self.playerOneLabel.textColor = [UIColor redColor];

    self.scoreInt = 0;
    self.turnInt = 0;

    self.originalDiceArray = [NSMutableArray arrayWithObjects:
                            self.dieOneLabel,
                            self.dieTwoLabel,
                            self.dieThreeLabel,
                            self.dieFourLabel,
                            self.dieFiveLabel,
                            self.dieSixLabel,
                            nil];

    for (DieLabel *dieLabel in self.originalDiceArray)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"blue%@", dieLabel.text]];
        dieLabel.backgroundColor = [UIColor colorWithPatternImage:image];
        dieLabel.textColor = [UIColor clearColor];
    }

    self.updatedDiceArray = [NSMutableArray new];
}

-(void)dieWasTapped:(DieLabel *)dieLabel
{
    if (!self.turnInt == 0) {
        if (![self.updatedDiceArray containsObject:dieLabel])
        {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"green%@", dieLabel.text]];
            dieLabel.backgroundColor = [UIColor colorWithPatternImage:image];
            [self.originalDiceArray removeObject:dieLabel];
            [self.updatedDiceArray addObject:dieLabel];
        }
        else
        {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"blue%@", dieLabel.text]];
            dieLabel.backgroundColor = [UIColor colorWithPatternImage:image];
            [self.updatedDiceArray removeObject:dieLabel];
            [self.originalDiceArray addObject:dieLabel];
        }

        if ([dieLabel.text isEqualToString:@"1"]) {
            self.scoreInt += 100;
        }
    }
}

- (IBAction)onRollPressed:(UIButton *)sender
{
    self.turnInt += 1;
    for (DieLabel *dieLabel in self.originalDiceArray)
    {
            [dieLabel roll:sender];
    }
}

- (IBAction)onImDonePointMeTapped:(UIButton *)sender
{
    self.playerOneScore.text = [NSString stringWithFormat:@"%i", self.scoreInt];
}

- (IBAction)onTurnOverTapped:(UIButton *)sender {

}



@end
