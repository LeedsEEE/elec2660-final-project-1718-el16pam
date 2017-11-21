//
//  SettingsScreenViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Time.h"
@interface SettingsScreenViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

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
@property NSInteger rows;
@property  NSInteger FirstSignificantFigure;
@property  NSInteger SecondSignificantFigure;
@property  NSInteger ThirdSignificantFigure;

- (IBAction)EasyButtonPressed:(UIButton *)sender;
- (IBAction)NormalButtonPressed:(UIButton *)sender;
- (IBAction)HardButtonPressed:(UIButton *)sender;
- (IBAction)BackToStartButton:(UIButton *)sender;

@property (strong, nonatomic) Time *time;

@end
