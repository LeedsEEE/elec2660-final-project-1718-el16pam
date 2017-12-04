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
    
    self.NoTimeLeftLabel.hidden = true;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeleft = [defaults integerForKey:@"TimeLeft"];
    
    self.time1.timeMole1Showed = [defaults integerForKey:@"TimeMole1s"];
    self.time1.timeMole1Hidden = [defaults integerForKey:@"TimeMole1h"];
    
    self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.time1.timeleft];
    //display time set on the settings view

    self.score.highestscore = [defaults integerForKey:@"HighestScore"];
    self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
    
    //self.time1.timeMole = [defaults integerForKey:@"timeMole"];
    
    [self startMole1];
    [self.time1 startTimer];
    [self changeLabels];
    
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

- (void) startMole1 {
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Mole1t) userInfo:nil repeats:YES];
    
}


- (void) changeLabels {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeleft = [defaults integerForKey:@"TimeLeft"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimeLeftLabel) userInfo:nil repeats:YES];
    
}

-(void) changeTimeLeftLabel {

    if (self.time1.timeleft >= 0) {
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %.0fs", self.time1.timeleft];
    }
    if (self.time1.timeleft == 0) {
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
        self.NoTimeLeftLabel.hidden = false;
    }
}

- (void) Mole1t {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.TimeMoleSet = [defaults integerForKey:@"TimeMoleSet"];
    self.time1.timeleft = [defaults integerForKey:@"TimeLeft"];
    if (self.Mole1Button.hidden == true) {
        self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole1Showed target:self selector:@selector(Mole1) userInfo:nil repeats:NO];
        self.time1.waittime = self.time1.timeMole1Showed;
    }
    else {
        self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole1Hidden target:self selector:@selector(Mole1) userInfo:nil repeats:NO];
        self.time1.waittime = self.time1.timeMole1Showed;
    }
    }
-(void) Mole1 {
    if (self.time1.timeleft > 0) {
    if (self.Mole1Button.hidden == false){
        NSLog(@"Hide Mole1");
        self.Mole1Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole1");
        self.Mole1Button.hidden = false;
    }}}
-(void) Mole2 {
    if (self.time1.timeleft > 0) {
    if (self.Mole2Button.hidden == false){
        NSLog(@"Hide Mole2");
        self.Mole2Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole2");
        self.Mole2Button.hidden = false;
    }}}
-(void) Mole3 {
    if (self.time1.timeleft > 0) {
    if (self.Mole3Button.hidden == false){
        NSLog(@"Hide Mole3");
        self.Mole3Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole3");
        self.Mole3Button.hidden = false;
    }}}
-(void) Mole4 {
    if (self.time1.timeleft > 0) {
    if (self.Mole4Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole4Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole4Button.hidden = false;
    }}}
-(void) Mole5 {
    if (self.time1.timeleft > 0) {
    if (self.Mole5Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole5Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole5Button.hidden = false;
    }}}
-(void) Mole6 {
    if (self.time1.timeleft > 0) {
    if (self.Mole6Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole6Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole6Button.hidden = false;
    }}}
-(void) Mole7 {
    if (self.time1.timeleft > 0) {
    if (self.Mole7Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole7Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole7Button.hidden = false;
    }}}
-(void) Mole8 {
    if (self.time1.timeleft > 0) {
    if (self.Mole8Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole8Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole8Button.hidden = false;
    }}}
-(void) Mole9 {
    if (self.time1.timeleft > 0) {
    if (self.Mole9Button.hidden == false){
        NSLog(@"Hide Mole");
        self.Mole9Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole");
        self.Mole9Button.hidden = false;
    }}}

/*- (void) firemoles{
   NSInteger Rand = arc4random() % 10;
    
}*/



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
        self.time.timer = [NSTimer scheduledTimerWithTimeInterval: self.time.timeMole target:self selector:@selector(HideMole:) userInfo:nil repeats:YES];
    }
}*/

/*for (int i = self.time.timeselected; i>0; i--) {
    self.time.timer = [NSTimer scheduledTimerWithTimeInterval: self.time.timeMole target:self selector:@selector(HideMole:) userInfo:nil repeats:YES];
}*/

#pragma mark moles buttons

- (IBAction)Mole1Pressed:(UIButton *)sender {
    
        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole1Button.hidden = true;                                                                 //hides the button
    
    [self.score HighestScore];
    
}

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.Mole2Button.hidden == false & self.time1.timeleft > 0) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole2Button.hidden = true;                                                                 //hides the button
        
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole3Button.hidden = true;                                                                 //hides the button
    
    [self.score HighestScore];
}

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole4Button.hidden = true;                                                                 //hides the button
        
    [self.score HighestScore];
}

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole5Button.hidden = true;                                                                 //hides the button
    
    [self.score HighestScore];
}

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole6Button.hidden = true;                                                                 //hides the button
        
    [self.score HighestScore];
}

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole7Button.hidden = true;                                                                 //hides the button
        
    [self.score HighestScore];
}

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole8Button.hidden = true;                                                                 //hides the button
    
    [self.score HighestScore];
}

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole9Button.hidden = true;                                                                 //hides the button
    
    [self.score HighestScore];
}

- (IBAction)BackToStart:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"BackFromGameScreen" sender:self];                                        //When Back button is pressed it will take you to the Main Screen
    
}
@end

