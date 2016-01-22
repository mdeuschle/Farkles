//
//  ViewController.m
//  Farkles
//
//  Created by Matt Deuschle on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

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
