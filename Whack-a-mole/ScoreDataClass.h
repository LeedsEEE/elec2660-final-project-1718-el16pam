//
//  Score.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "TimeDataClass.h"

@interface ScoreDataClass : NSObject

#pragma mark properties

@property int currentscore;
@property NSInteger highestscore;
//@property (strong, nonatomic) TimeDataClass *timeS;             //call the class TimeDataClass

-(void) HighestScore;
@end
