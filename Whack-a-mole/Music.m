//
//  Music.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//I learned how to use AVAudioPlayer in the extra lab screencast

//I got the sound from the following link http://soundbible.com/605-Wood-Whack.html
#import "Music.h"

@implementation Music

-(void) MoleWhack {     //When this method is called the sound from the file whack1.wav is played
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"whack1" ofType:@"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    self.whack = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
    [self.whack play];
    
}

@end
