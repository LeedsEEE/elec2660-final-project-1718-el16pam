//
//  SettingsScreenViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeDataClass.h"
#import "GameScreenViewController.h"

@interface SettingsScreenViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

#pragma mark properties
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *DifficultyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *TimePickerView;
@property (weak, nonatomic) IBOutlet UILabel *TimeSelectedLabel;
@property (weak, nonatomic) IBOutlet UIImageView *TickEasyImage;
// The image used was found in http://www.i2symbol.com/symbols/check/x2713-check-mark
@property (weak, nonatomic) IBOutlet UIImageView *TickNormalImage;
// The image used was found in http://www.i2symbol.com/symbols/check/x2713-check-mark
@property (weak, nonatomic) IBOutlet UIImageView *TickHardImage;
// The image used was found in http://www.i2symbol.com/symbols/check/x2713-check-mark
@property NSInteger rows;                                           //create a vaiable call rows
@property  NSInteger FirstSignificantFigure;                        //create a vaiable call FirstSignificantFigure
@property  NSInteger SecondSignificantFigure;                       //create a vaiable call SecondSignifcantFigure
@property  NSInteger ThirdSignificantFigure;                        //create a vaiable call ThirdSignificantFigure

#pragma mark actions

- (IBAction)EasyButtonPressed:(UIButton *)sender;
- (IBAction)NormalButtonPressed:(UIButton *)sender;
- (IBAction)HardButtonPressed:(UIButton *)sender;
- (IBAction)SaveButton:(UIButton *)sender;
- (IBAction)BackToStart:(UIButton *)sender;
//All the actions in my Screen View Controller

#pragma mark classes called

@property (strong, nonatomic) TimeDataClass *time;                  //call class TimeDataClass
@property (strong, nonatomic) GameScreenViewController *game;       //call class GameSceenViewController

@end
