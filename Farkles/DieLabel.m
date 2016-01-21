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
       // self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dieLabelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGestureRecognizer];

    }
    return  self;
}



-(void)dieLabelTapped {
    [self.delegate dieWasTapped:self];

}

@end
