//
//  Time.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Time.h"

@implementation Time
    

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
        
    }
    return self;
}

@end
