//
//  ViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "SettingsScreenViewController.h"
@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SettingButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowSettingsScreen" sender:self];
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
    
}


- (IBAction)GameButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowGameScreen" sender:self];
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
    
}
@end
