//
//  GameScreenViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Time.h"
#import "Score.h"

@interface GameScreenViewController : UIViewController
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

- (IBAction)Mole1Pressed:(UIButton *)sender;
- (IBAction)Mole2Pressed:(UIButton *)sender;
- (IBAction)Mole3Pressed:(UIButton *)sender;
- (IBAction)Mole4Pressed:(UIButton *)sender;
- (IBAction)Mole5Pressed:(UIButton *)sender;
- (IBAction)Mole6Pressed:(UIButton *)sender;
- (IBAction)Mole7Pressed:(UIButton *)sender;
- (IBAction)Mole8Pressed:(UIButton *)sender;
- (IBAction)Mole9Pressed:(UIButton *)sender;
- (IBAction)BackToStartPressed:(UIButton *)sender;
@end
