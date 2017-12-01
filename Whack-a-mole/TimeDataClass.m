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
        
        self.timeMoleHidden = 3;
        //self.timeMoleShowed = 4;
        self.gamescreen = [[GameScreenViewController alloc] init];
        
    }
    return self;
}

- (void) startTimer {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeleft = [defaults integerForKey:@"TimeLeft"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer) userInfo:nil repeats:YES];
    
}

-(void) fireTimer {
    if (self.timeleft > 0) {
        self.timeleft = self.timeleft - 1;
        
        NSLog(@"time left = %.0f", self.timeleft);
        //self.gamescreen.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.timeleft];

    }
}

/*- (void) startMoles {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeMoleHidden = [defaults integerForKey:@"TimeMoleHidden"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval: self.timeMoleHidden target:self.gamescreen selector:@selector(HideMole) userInfo:nil repeats:YES];
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
 self.timeMoleHidden = 5;
 self.timeMoleShowed = 4;
 }
 else if ([self.ssvc.difficulty isEqualToString:@"Easy"]) {
 self.timeMoleHidden = 3;
 self.timeMoleShowed = 2;
 }
 else if ([self.ssvc.difficulty isEqualToString:@"Easy"]) {
 self.timeMoleHidden = 1.5;
 self.timeMoleShowed = 1;
 }
 */
