//
//  DieLabel.m
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    
    if (self) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dieLabelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGestureRecognizer];
    }
    return  self;
}

-(void)dieLabelTapped
{
    [self.delegate dieWasTapped:self];
}

-(void)roll:(id)sender
{
    self.randomInt = 10;

    self.randomTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
}

-(void)timerUpdate;
{
    self.randomInt -= 1;

    self.randomDice = arc4random() % 6;
    switch (self.randomDice)
    {
        case 0:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue1"]];
            break;
        case 1:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue2"]];
            break;
        case 2:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue3"]];
            break;
        case 3:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue4"]];
            break;
        case 4:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue5"]];
            break;
        case 5:
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue6"]];
            break;

        default:
            break;
    }

    if (self.randomInt == 0) {
        [self.randomTimer invalidate];
    }
}

@end
