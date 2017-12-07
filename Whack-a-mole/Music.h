//
//  Music.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Music : NSObject

#pragma mark AVAudioPlayer
  
@property (strong, nonatomic) AVAudioPlayer *whack;

#pragma mark methods

-(void) MoleWhack;

@end
