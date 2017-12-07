//
//  ViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//To learn how to use NSUserDefaults i used the following link http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/

#import "HomeScreenViewController.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

    #pragma mark viewDidLoad
    
- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.time = [[TimeDataClass alloc] init];
    self.SelectTime.hidden = true;      //hides the label  SelectTime
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time.timeleftminute = [defaults integerForKey:@"TimeLeftMinute"];      //sets the variable timeleftminutes to the value saved to the key @"TimeLeftMinute"
    self.time.timeleftseconds = [defaults integerForKey:@"TimeLeftSeconds"];    //sets the variable timeleftseconds to the value saved to the key @"TimeLeftSeconds"
 
    [self background];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark actions

- (IBAction)SettingButtonPressed:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"ShowSettingsScreen" sender:self];                                        //When settings button is pressed it will take you to the SettingsScreenViewController
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
    
}


- (IBAction)GameButtonPressed:(UIButton *)sender {
    
    if (self.time.timeleftminute != 0 | self.time.timeleftseconds != 0) {
    
    [self performSegueWithIdentifier:@"ShowGameScreen" sender:self];                                            //When settings button is pressed it will take you to the GameScreenViewController
    // This is from https://stackoverflow.com/questions/34655473/how-to-open-new-view-controller-after-click-button
  //  self.gamescreen.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0f", self.time1.timeselected];
    }
    else {
        self.SelectTime.hidden = false;     //if the time is 0 the label SelectTime will show
    }
    
}

#pragama mark background

-(void) background {        //Method that will set the background image to Background_app.png + it will also autosize it to fill the sceen
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background_app.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //Learn how to do this using the following link https://stackoverflow.com/questions/8077740/how-to-fill-background-image-of-an-uiview

}
@end
