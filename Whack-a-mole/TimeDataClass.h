//
//  Time.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeDataClass : NSObject
@property float timeselected;
@property int timeRemaining;
@property float timeMoleShowed;
@property float timeMoleHidden;

@property (strong, nonatomic) NSTimer *timer;

//@property (nonatomic) SettingsScreenViewController *ssvc;

@end
