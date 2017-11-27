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
@property (weak, nonatomic) IBOutlet UILabel *GameName;

- (IBAction)SettingButtonPressed:(UIButton *)sender;
- (IBAction)GameButtonPressed:(UIButton *)sender;

//@property (strong, nonatomic) GameScreenViewController *gamescreen;
//@property (strong, nonatomic) TimeDataClass *time1;

@end

