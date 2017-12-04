//
//  ViewController.h
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameScreenViewController.h"

@interface HomeScreenViewController : UIViewController

#pragma mark properties

@property (weak, nonatomic) IBOutlet UILabel *GameName;

#pragma mark actions

- (IBAction)SettingButtonPressed:(UIButton *)sender;
- (IBAction)GameButtonPressed:(UIButton *)sender;

//@property (strong, nonatomic) GameScreenViewController *gamescreen;


@end

