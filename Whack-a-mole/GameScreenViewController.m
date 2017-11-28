//
//  GameScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//


//To learn how to use NSTimer I used the following links https://stackoverflow.com/questions/13993945/make-a-button-visible-after-some-time-with-nstimer and https://stackoverflow.com/questions/5792804/making-a-function-wait-a-certain-amount-of-time-before-it-executes

#import "GameScreenViewController.h"

@interface GameScreenViewController ()

@end
int i;
@implementation GameScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.time1 = [[TimeDataClass alloc] init];
    //initialize time data class in the game screen view
    self.score = [[ScoreDataClass alloc] init];
    //initialize score data class in the game screen view
    
    self.Mole1Button.hidden = false;
    self.Mole2Button.hidden = true;
    self.Mole3Button.hidden = true;
    self.Mole4Button.hidden = true;
    self.Mole5Button.hidden = true;
    self.Mole6Button.hidden = true;
    self.Mole7Button.hidden = true;
    self.Mole8Button.hidden = true;
    self.Mole9Button.hidden = true;
    //set all 9 buttons to hidden
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeleft = [defaults integerForKey:@"TimeLeft"];
    //http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/
    
    self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.timeleft];
    //display time set on the settings view
    
    self.score.highestscore = [defaults integerForKey:@"HighestScore"];
    //http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/
    self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %i", self.score.highestscore];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void) HideMole:(NSTimer *)timer {
    
    if (self.Mole1Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole1Button.hidden = true;
    }
    else if (self.Mole1Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole1Button.hidden = false;
    }
}

- (void)HighestScore {
    if (self.score.currentscore > self.score.highestscore) {
        self.score.highestscore = self.score.currentscore;
        
        NSLog(@"hs = %i",self.score.highestscore);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.score.highestscore forKey:@"HighestScore"];
        [defaults synchronize];
        //http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/
    }
    if (self.timeleft == 0) {
        
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %i", self.score.highestscore];
    }
}



/*
-(void) HideMole:(NSTimer *)timer {         //set the time the mole will be hidden after pressed
    
        NSLog(@"Hide Mole");
        self.Mole1Button.hidden = false;
    
    }*/

/*-(void) ShowMole:(NSTimer *)timer {
    if (self.Mole1Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole1Button.hidden = false;
    }
//    NSLog(@"Hide Button");
//    self.Mole1Button.hidden = true;
}*/
/*-(void) ShowMole:(NSTimer *)timer {
    NSLog(@"Hide Button");
    self.Mole1Button.hidden = false;
}*/

/*- (void) ShowHideMole {
    for (int i = self.time.timeselected; i>0; i--) {
        self.time.timer = [NSTimer scheduledTimerWithTimeInterval: self.time.timeMoleHidden target:self selector:@selector(HideMole:) userInfo:nil repeats:YES];
    }
}*/

/*for (int i = self.time.timeselected; i>0; i--) {
    self.time.timer = [NSTimer scheduledTimerWithTimeInterval: self.time.timeMoleHidden target:self selector:@selector(HideMole:) userInfo:nil repeats:YES];
}*/

#pragma mark mole 1

- (IBAction)Mole1Pressed:(UIButton *)sender {
    
    if (self.Mole1Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;                                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];                      //updates the score label
        self.Mole1Button.hidden = true;                                                                                 //hides the button
        self.time1.timer = [NSTimer scheduledTimerWithTimeInterval: self.time1.timeMoleHidden target:self selector:@selector(HideMole:) userInfo:nil repeats:YES];                                                             //will show the button after the specified time
    }
    
    
    [self HighestScore];
    
}

#pragma mark mole 2

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.Mole2Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 3

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
    if (self.Mole3Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 4

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    if (self.Mole4Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 5

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    if (self.Mole5Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 6

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    if (self.Mole6Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 7

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    if (self.Mole7Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 8

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    if (self.Mole8Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

#pragma mark mole 9

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    if (self.Mole9Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)BackToStartPressed:(UIButton *)sender {
}
@end
