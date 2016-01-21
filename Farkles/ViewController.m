//
//  ViewController.m
//  Farkles
//
//  Created by Matt Deuschle on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () //<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieOneLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDieOneLabel:self.dieOneLabel];


    //self.dieOneLabel.layer.cornerRadius = 10;
    //self.dieOneLabel.clipsToBounds = YES;
    //[self.dieOneLabel setBackgroundColor:[UIColor greenColor]];

    
}

-(void)dieWasTapped:(DieLabel *)dieLabel {
    

    [self.dieOneLabel setBackgroundColor:[UIColor greenColor]];

}

@end
