//
//  Time.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//To learn how to use NSTimer I used the following links https://stackoverflow.com/questions/13993945/make-a-button-visible-after-some-time-with-nstimer and https://stackoverflow.com/questions/5792804/making-a-function-wait-a-certain-amount-of-time-before-it-executes

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

#pragma mark timer methods

- (void) startTimer {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.timeleftminute forKey:@"TimeLeftMinute"];
    [defaults synchronize];
    [defaults setInteger:self.timeleftseconds forKey:@"TimeLeftSeconds"];
    [defaults synchronize];
    [defaults setInteger:self.timeleft forKey:@"TimeLeft"];
    [defaults synchronize];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer) userInfo:nil repeats:YES];//every second it will run the method fireTimer. Basically a countdown
    
}

-(void) fireTimer {

    if (self.timeleftminute != 0 | self.timeleftseconds != 0) {
                if (self.timeleftseconds != 0) {
            self.timeleftseconds -= 1;
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
