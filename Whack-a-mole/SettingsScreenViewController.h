//
//  SettingsScreenViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsScreenViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *DifficultyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *TimePickerView;
@property (weak, nonatomic) IBOutlet UIImageView *TickEasyImage;
@property (weak, nonatomic) IBOutlet UIImageView *TickNormalImage;
@property (weak, nonatomic) IBOutlet UIImageView *TickHardImage;

- (IBAction)EasyButtonPressed:(UIButton *)sender;
- (IBAction)NormalButtonPressed:(UIButton *)sender;
- (IBAction)HardButtonPressed:(UIButton *)sender;
- (IBAction)BackToStartButton:(UIButton *)sender;


@end
