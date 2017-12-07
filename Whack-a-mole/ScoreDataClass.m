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
        self.highestscoreEasy = 0;
        self.highestscoreNormal = 0;
        self.highestscoreHard = 0;
        
    }
    return self;
}

- (void)HighestScoreEasy {
    if (self.currentscore > self.highestscoreEasy) {
        self.highestscoreEasy = self.currentscore;
        
        NSLog(@"hs = %li",(long)self.highestscoreEasy);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.highestscoreEasy forKey:@"HighestScoreEasy"];
        [defaults synchronize];
    }
    
}
- (void)HighestScoreNormal {
    if (self.currentscore > self.highestscoreNormal) {
        self.highestscoreNormal = self.currentscore;
        
        NSLog(@"hs = %li",(long)self.highestscoreNormal);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.highestscoreNormal forKey:@"HighestScoreNormal"];
        [defaults synchronize];
    }
    
}
- (void)HighestScoreHard {
    if (self.currentscore > self.highestscoreHard) {
        self.highestscoreHard = self.currentscore;
        
        NSLog(@"hs = %li",(long)self.highestscoreHard);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.highestscoreHard forKey:@"HighestScoreHard"];
        [defaults synchronize];
    }
    
}


@end
