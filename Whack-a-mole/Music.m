//
//  Music.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Music.h"

@implementation Music

-(void) MoleWhack {
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"whack1" ofType:@"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    self.whack = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
    [self.whack play];
    
}

@end
