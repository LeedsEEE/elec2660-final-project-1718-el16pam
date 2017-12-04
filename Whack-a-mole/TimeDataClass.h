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

@property float timeleft;
@property float timeselected;
@property int timeRemaining;

/*@property float timeMole1Hidden;
@property float timeMole2Hidden;
@property float timeMole3Hidden;
@property float timeMole4Hidden;
@property float timeMole5Hidden;
@property float timeMole6Hidden;
@property float timeMole7Hidden;
@property float timeMole8Hidden;
@property float timeMole9Hidden;

@property float timeMole1Showed;
@property float timeMole2Showed;
@property float timeMole3Showed;
@property float timeMole4Showed;
@property float timeMole5Showed;
@property float timeMole6Showed;
@property float timeMole7Showed;
@property float timeMole8Showed;
@property float timeMole9Showed;*/

@property float timeMole1;
@property float timeMole2;
@property float timeMole3;
@property float timeMole4;
@property float timeMole5;
@property float timeMole6;
@property float timeMole7;
@property float timeMole8;
@property float timeMole9;

@property float waittime;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) GameScreenViewController *gamescreen;

//@property (nonatomic) SettingsScreenViewController *ssvc;

-(void) startTimer;
//-(void) startMoles;


@end
