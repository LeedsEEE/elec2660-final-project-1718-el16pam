//
//  Score.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ScoreDataClass.h"

@implementation ScoreDataClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.currentscore = 0;
        self.highestscore = 0;
        
    }
    return self;
}

@end
