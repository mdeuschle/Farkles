//
//  DieLabel.m
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "DieLabel.h"
#import "Dice.h"

@implementation DieLabel

-(instancetype)initWithCoder:(NSCoder *)coder{

    self = [super initWithCoder:coder];
    
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dieLabelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return self;
}

-(void)dieLabelTapped
{
    [self.delegate dieWasTapped:self];
}

-(void)roll:(id)sender
{
    self.randomInt = 15;
    self.randomTimer = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
}

-(void)timerUpdate;
{
    self.randomInt -= 1;

    int randomInt = arc4random_uniform(6) + 1;
    self.text = [NSString stringWithFormat:@"%i", randomInt];

    UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"blue%i", randomInt]];
    self.backgroundColor = [UIColor colorWithPatternImage:img];

    self.textColor = [UIColor clearColor];

    if (self.randomInt <= 0) {
        [self.randomTimer invalidate];
    }
}

-(void)holdLabel
{
    [self diceArrayMethod];

}

-(void)diceArrayMethod
{
    self.die1 = [[Dice alloc]initWithFullLabels:1
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green1"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue1"]]];

    self.die2 = [[Dice alloc]initWithFullLabels:2
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green2"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue2"]]];

    self.die3 = [[Dice alloc]initWithFullLabels:3
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green3"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue3"]]];

    self.die4 = [[Dice alloc]initWithFullLabels:4
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green4"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue4"]]];

    self.die5 = [[Dice alloc]initWithFullLabels:5
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green5"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5"]]];

    self.die6 = [[Dice alloc]initWithFullLabels:6
                                  andGreenLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"green6"]]
                                   andBlueLabel:[UIColor colorWithPatternImage:[UIImage imageNamed:@"blue6"]]];

    self.diceArray = [NSArray arrayWithObjects:self.die1, self.die2, self.die3, self.die4, self.die5, self.die6, nil];
}






@end
