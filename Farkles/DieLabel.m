//
//  DieLabel.m
//  Farkles
//
//  Created by Jonathan Kilgore on 1/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandler)];
        self.gestureRecognizers = @[tapGestureRecognizer];
        
        for (UITapGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
        }
    }
    return  self;
}



-(void)tapHandler:(UITapGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];

    if (CGRectContainsPoint(self.frame, point)) {
        [gestureRecognizer.view setTransform:CGAffineTransformTranslate(gestureRecognizer.view.transform, point.x, point.y)];
        
        
    }
}

@end
