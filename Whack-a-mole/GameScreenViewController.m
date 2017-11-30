//
//  GameScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//


//To learn how to use NSTimer I used the following links https://stackoverflow.com/questions/13993945/make-a-button-visible-after-some-time-with-nstimer and https://stackoverflow.com/questions/5792804/making-a-function-wait-a-certain-amount-of-time-before-it-executes

//To learn how to use NSUserDefaults i used the following link http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/

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
    
    self.Mole1Button.hidden = true;
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
    
    self.TimeMole = [defaults integerForKey:@"TimeMole"];
    
    self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.timeleft];
    //display time set on the settings view

    self.score.highestscore = [defaults integerForKey:@"HighestScore"];
    self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
    
    self.time1.timeMoleHidden = [defaults integerForKey:@"TimeMoleHidden"];
    
    [self startMoles];
    [self startTimer];
    
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

-(void) HideMole {
    
    if (self.Mole1Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole1Button.hidden = true;
    }
    else if (self.Mole1Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole1Button.hidden = false;
    }
    if (self.Mole2Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole2Button.hidden = true;
    }
    else if (self.Mole2Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole2Button.hidden = false;
    }
    if (self.Mole3Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole3Button.hidden = true;
    }
    else if (self.Mole3Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole3Button.hidden = false;
    }
    if (self.Mole4Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole4Button.hidden = true;
    }
    else if (self.Mole4Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole4Button.hidden = false;
    }
    if (self.Mole5Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole5Button.hidden = true;
    }
    else if (self.Mole5Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole5Button.hidden = false;
    }
    if (self.Mole6Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole6Button.hidden = true;
    }
    else if (self.Mole6Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole6Button.hidden = false;
    }
    if (self.Mole7Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole7Button.hidden = true;
    }
    else if (self.Mole7Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole7Button.hidden = false;
    }
    if (self.Mole8Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole8Button.hidden = true;
    }
    else if (self.Mole8Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole8Button.hidden = false;
    }
    if (self.Mole9Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole9Button.hidden = true;
    }
    else if (self.Mole9Button.hidden == true) {
        NSLog(@"Show Mole");
        self.Mole9Button.hidden = false;
    }
}

#pragma mark Highest Score

- (void)HighestScore {
    if (self.score.currentscore > self.score.highestscore) {
        self.score.highestscore = self.score.currentscore;
        
        NSLog(@"hs = %li",(long)self.score.highestscore);
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:self.score.highestscore forKey:@"HighestScore"];
        [defaults synchronize];
    }
    if (self.timeleft == 0) {
        
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
    }
}

- (void) startMoles {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMoleHidden = [defaults integerForKey:@"TimeMoleHidden"];
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval: self.time1.timeMoleHidden target:self selector:@selector(HideMole) userInfo:nil repeats:YES];
}

/*- (void) firemoles{
   NSInteger Rand = arc4random() % 10;
    
}*/

- (void) startTimer {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.timeleft = [defaults integerForKey:@"TimeLeft"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer) userInfo:nil repeats:YES];
    
    
    
}

-(void) fireTimer {
    if (self.timeleft > 0) {
        self.timeleft = self.timeleft - 1;
        
        NSLog(@"time left = %.0f", self.timeleft);
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.timeleft];
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

#pragma mark moles buttons

- (IBAction)Mole1Pressed:(UIButton *)sender {
    
    if (self.Mole1Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole1Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
    
}

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.Mole2Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole2Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
    if (self.Mole3Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole3Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    if (self.Mole4Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole4Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    if (self.Mole5Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole5Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    if (self.Mole6Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole6Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    if (self.Mole7Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole7Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    if (self.Mole8Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole8Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    if (self.Mole9Button.hidden == false) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole9Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self HighestScore];
}

- (IBAction)BackToStartPressed:(UIButton *)sender {
}
@end
