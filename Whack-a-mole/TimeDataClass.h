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
@property float timeMole;

@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) GameScreenViewController *gamescreen;

//@property (nonatomic) SettingsScreenViewController *ssvc;

-(void) startTimer;
//-(void) startMoles;


@end
