//
//  Time.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TimeDataClass.h"

@implementation TimeDataClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.gamescreen = [[GameScreenViewController alloc] init];
        
    }
    return self;
}

- (void) startTimer {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.timeleftminute forKey:@"TimeLeftMinute"];
    [defaults synchronize];
    [defaults setInteger:self.timeleftseconds forKey:@"TimeLeftSeconds"];
    [defaults synchronize];
    [defaults setInteger:self.timeleft forKey:@"TimeLeft"];
    [defaults synchronize];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer) userInfo:nil repeats:YES];
    
}

-(void) fireTimer {

    if (self.timeleftminute != 0 | self.timeleftseconds != 0) {
                if (self.timeleftseconds != 0) {
            self.timeleftseconds -= 1;
            /*if (self.timeleft/5.0 == floorf(self.timeleft/5.0)) { //https://stackoverflow.com/questions/20018819/check-if-float-value-is-integer
             NSLog(@"time left = %.0f", self.timeleft)
             }*/
        }
        else if (self.timeleftseconds == 0){
            self.timeleftminute -= 1;
            self.timeleftseconds = 59;
        }
    else {
        
            self.timeleftseconds = 0;
            self.timeleftminute = 0;
            

    }
    }
}


@end
