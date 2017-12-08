//
//  Time.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScreenViewController.h"
@class GameScreenViewController;

@interface TimeDataClass : NSObject

#pragma mark properties

@property  NSInteger minute;                        //create a vaiable call minute
@property NSInteger seconds;                        //create a vaiable call seconds
@property float timeleftminute;
@property float timeleftseconds;
@property float timeselected;
@property int timeRemaining;
@property float starttime;
@property float timeleft;

@property float timeMole1;
@property float timeMole2;
@property float timeMole3;
@property float timeMole4;
@property float timeMole5;
@property float timeMole6;
@property float timeMole7;
@property float timeMole8;
@property float timeMole9;

@property (strong, nonatomic) NSTimer *timer;

#pragma mark classes called

@property (strong, nonatomic) GameScreenViewController *gamescreen;

#pragma mark methods

-(void) startTimer;

@end
