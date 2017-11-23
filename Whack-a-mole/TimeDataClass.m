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
        self.ssvc = [[SettingsScreenViewController alloc] init];
        
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
        self.timeselected = self.ssvc.FirstSignificantFigure*100 + self.ssvc.SecondSignificantFigure*10 + self.ssvc.ThirdSignificantFigure;   //Calculates the time selected using the values extracted from the picker
 
        self.ssvc.TimeSelectedLabel.text = [NSString stringWithFormat:@"Time = %.0fs", self.timeselected];                          //Displays the Time Selected
    }
    return self;
}

@end
