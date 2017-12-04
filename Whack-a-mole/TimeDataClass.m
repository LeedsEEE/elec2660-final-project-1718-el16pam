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
        
        //self.timeMole = ((arc4random_uniform(110) + 250.0f)/100.0f);
        //self.timeMoleShowed = 4;
        self.gamescreen = [[GameScreenViewController alloc] init];
        
    }
    return self;
}

/*- (void) startMoles {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.gamescreen.TimeMoleSet = [defaults integerForKey:@"TimeMoleSet"];
    self.timeleft = [defaults integerForKey:@"TimeLeft"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.gamescreen.TimeMoleSet target:self selector:@selector(Mole1) userInfo:nil repeats:YES];
}

-(void) Mole1 {
    [self.gamescreen Mole1];
}*/
- (void) startTimer {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeleft = [defaults integerForKey:@"TimeLeft"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer) userInfo:nil repeats:YES];
    
}

-(void) fireTimer {
    if (self.timeleft > 0) {
        self.timeleft = self.timeleft - 1;
        if (self.timeleft/5.0 == floorf(self.timeleft/5.0)) { //https://stackoverflow.com/questions/20018819/check-if-float-value-is-integer
            NSLog(@"time left = %.0f", self.timeleft);
        }
        
        
    }
}

/*- (void) startMoles {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeMole = [defaults integerForKey:@"timeMole"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval: self.timeMole target:self.gamescreen selector:@selector(HideMole) userInfo:nil repeats:YES];
}*/

/*-(void) HideMole {
    
    if (self.gamescreen.Mole1Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole1Button.hidden = true;
    }
    else if (self.gamescreen.Mole1Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole1Button.hidden = false;
    }
    if (self.gamescreen.Mole2Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole2Button.hidden = true;
    }
    else if (self.gamescreen.Mole2Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole2Button.hidden = false;
    }
    if (self.gamescreen.Mole3Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole3Button.hidden = true;
    }
    else if (self.gamescreen.Mole3Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole3Button.hidden = false;
    }
    if (self.gamescreen.Mole4Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole4Button.hidden = true;
    }
    else if (self.gamescreen.Mole4Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole4Button.hidden = false;
    }
    if (self.gamescreen.Mole5Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole5Button.hidden = true;
    }
    else if (self.gamescreen.Mole5Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole5Button.hidden = false;
    }
    if (self.gamescreen.Mole6Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole6Button.hidden = true;
    }
    else if (self.gamescreen.Mole6Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole6Button.hidden = false;
    }
    if (self.gamescreen.Mole7Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole7Button.hidden = true;
    }
    else if (self.gamescreen.Mole7Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole7Button.hidden = false;
    }
    if (self.gamescreen.Mole8Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole8Button.hidden = true;
    }
    else if (self.gamescreen.Mole8Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole8Button.hidden = false;
    }
    if (self.gamescreen.Mole9Button.hidden == false){
        NSLog(@"Hide Mole");
        self.gamescreen.Mole9Button.hidden = true;
    }
    else if (self.gamescreen.Mole9Button.hidden == true) {
        NSLog(@"Show Mole");
        self.gamescreen.Mole9Button.hidden = false;
    }
}*/



@end


//self.ssvc = [[SettingsScreenViewController alloc] init];

/*
 if ([self.ssvc.difficulty isEqualToString:@"Easy"]) {
 self.timeMole = 5;
 self.timeMoleShowed = 4;
 }
 else if ([self.ssvc.difficulty isEqualToString:@"Easy"]) {
 self.timeMole = 3;
 self.timeMoleShowed = 2;
 }
 else if ([self.ssvc.difficulty isEqualToString:@"Easy"]) {
 self.timeMole = 1.5;
 self.timeMoleShowed = 1;
 }
 */
