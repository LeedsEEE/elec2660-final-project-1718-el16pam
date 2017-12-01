//
//  ViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//To learn how to use NSUserDefaults i used the following link http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/

#import "HomeScreenViewController.h"
#import "SettingsScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 //   self.gamescreen = [[GameScreenViewController alloc] init];
 //   self.time1 = [[TimeDataClass alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:120 forKey:@"TimeLeft"];
    
    [defaults setInteger:3 forKey:@"TimeMoleHidden"];
    
    [defaults synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SettingButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowSettingsScreen" sender:self];                                        //When settings button is pressed it will take you to the SettingsScreenViewController
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
    
}


- (IBAction)GameButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowGameScreen" sender:self];                                            //When settings button is pressed it will take you to the GameScreenViewController
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
  //  self.gamescreen.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0f", self.time1.timeselected];
    
}
@end
