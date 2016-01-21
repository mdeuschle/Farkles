//
//  DieLabel.h
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate;

@interface DieLabel:UILabel

@property (weak, nonatomic) IBOutlet id <DieLabelDelegate> delegate;


@end

@protocol DieLabelDelegate <NSObject>

-(void)dieWasTapped:(DieLabel *)dieLabel;


@end