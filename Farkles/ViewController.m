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

@property NSArray *diceLabelsArray; // original was 'allDiesArray'

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.diceLabelsArray = [NSArray arrayWithObjects:
                            self.dieOneLabel,
                            self.dieTwoLabel,
                            self.dieThreeLabel,
                            self.dieFourLabel,
                            self.dieFiveLabel,
                            self.dieSixLabel,
                            nil];

    for (DieLabel *dieLabel in self.diceLabelsArray)
    {
        dieLabel.dieSelected = NO;
        dieLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green6"]];
    }
}

-(void)dieWasTapped:(DieLabel *)dieLabel
{
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"green%@", dieLabel.text]];
    dieLabel.backgroundColor = [UIColor colorWithPatternImage:image];
    dieLabel.dieSelected = YES;
}

- (IBAction)onRollPressed:(UIButton *)sender
{
    for (DieLabel *dieLabel in self.diceLabelsArray)
    {
        if (!dieLabel.dieSelected) {
            [dieLabel roll:sender];
        }
    }
}

- (IBAction)onImDonePointMeTapped:(UIButton *)sender {

}
- (IBAction)onTurnOverTapped:(UIButton *)sender {

}


@end
