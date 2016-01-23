//
//  ViewController.m
//  Farkles
//
//  Created by Matt Deuschle on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"
#import "Dice.h"

@interface ViewController () <UIGestureRecognizerDelegate, DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieOneLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieTwoLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieThreeLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieFourLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieFiveLabel;
@property (weak, nonatomic) IBOutlet DieLabel *dieSixLabel;

@property (strong, nonatomic) IBOutlet DieLabel *userScore;
@property (strong, nonatomic) IBOutlet DieLabel *userTwoScore;

@property NSArray *diceLabelsArray;
@property NSArray *diceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Dice *die1 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green1"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue1"]]];

    Dice *die2 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green2"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue2"]]];

    Dice *die3 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green3"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue3"]]];

    Dice *die4 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green4"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue4"]]];

    Dice *die5 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5"]]];

    Dice *die6 = [[Dice alloc]initWithFullLabels:1
                                   andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green6"]]
                                    andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue6"]]];

    self.diceArray = [NSArray arrayWithObjects:die1, die2, die3, die4, die5, die6, nil];


    self.diceLabelsArray = [NSArray arrayWithObjects:
                            self.dieOneLabel,
                            self.dieTwoLabel,
                            self.dieThreeLabel,
                            self.dieFourLabel,
                            self.dieFiveLabel,
                            self.dieSixLabel,
                            nil];

}

-(void)dieWasTapped:(DieLabel *)dieLabel
{
        dieLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green1"]];
}

- (IBAction)onRollPressed:(UIButton *)sender
{
    for (DieLabel *dieLabel in self.diceLabelsArray)
    {
        [dieLabel roll:sender];
    }
}

- (IBAction)onImDonePointMeTapped:(UIButton *)sender {

}
- (IBAction)onTurnOverTapped:(UIButton *)sender {

}


@end
