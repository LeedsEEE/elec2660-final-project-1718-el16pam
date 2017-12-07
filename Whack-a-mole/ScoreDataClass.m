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
        
        //sets the initial values
        self.currentscore = 0;
        self.highestscore = 0;
        
    }
    return self;
}

- (void)HighestScore {
    if (self.currentscore > self.highestscore) {
        self.highestscore = self.currentscore;
        
        NSLog(@"hs = %li",(long)self.highestscore);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.highestscore forKey:@"HighestScore"];
        [defaults synchronize];
    }

}

@end
