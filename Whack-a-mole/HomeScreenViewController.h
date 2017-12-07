//
//  ViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameScreenViewController.h"
#import "TimeDataClass.h"
#import "SettingsScreenViewController.h"

@interface HomeScreenViewController : UIViewController

#pragma mark properties

@property (weak, nonatomic) IBOutlet UILabel *GameName;
@property (weak, nonatomic) IBOutlet UILabel *SelectTime;

#pragma mark actions

- (IBAction)SettingButtonPressed:(UIButton *)sender;
- (IBAction)GameButtonPressed:(UIButton *)sender;

#pragma mark classes called

@property (strong,nonatomic) TimeDataClass *time;

#pragma mark methods

-(void) background;

@end

