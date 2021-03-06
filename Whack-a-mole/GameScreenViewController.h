//
//  GameScreenViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

// find out about the @class name here https://stackoverflow.com/questions/31290769/two-class-access-each-other-by-importing-their-head-filevia-import-causes-er

#pragma mark classes imported
#import <UIKit/UIKit.h>
#import "TimeDataClass.h"
@class TimeDataClass;       //I added this because I import the GameScreenViewController in the TimeDataClass too
#import "ScoreDataClass.h"
#import "Music.h"

@interface GameScreenViewController : UIViewController

#pragma mark properties

@property (weak, nonatomic) IBOutlet UILabel *TimeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *HighestScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *NoTimeLeftLabel;
@property (weak, nonatomic) IBOutlet UIButton *Mole1Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole2Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole3Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole4Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole5Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole6Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole7Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole8Button;
@property (weak, nonatomic) IBOutlet UIButton *Mole9Button;

@property (weak, nonatomic)NSString *difficulty;

@property float TimeMoleSet; //?

#pragma mark actions

- (IBAction)Mole1Pressed:(UIButton *)sender;
- (IBAction)Mole2Pressed:(UIButton *)sender;
- (IBAction)Mole3Pressed:(UIButton *)sender;
- (IBAction)Mole4Pressed:(UIButton *)sender;
- (IBAction)Mole5Pressed:(UIButton *)sender;
- (IBAction)Mole6Pressed:(UIButton *)sender;
- (IBAction)Mole7Pressed:(UIButton *)sender;
- (IBAction)Mole8Pressed:(UIButton *)sender;
- (IBAction)Mole9Pressed:(UIButton *)sender;
- (IBAction)BackToStart:(UIButton *)sender;

#pragma mark classes called

@property (strong, nonatomic) TimeDataClass *time1;             //call the class TimeDataClass
@property (strong, nonatomic) ScoreDataClass *score;            //call the class ScoreDataClass
@property (strong, nonatomic) Music *music;                     //call the class Music

@end

