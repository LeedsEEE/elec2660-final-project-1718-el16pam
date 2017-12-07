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

@implementation GameScreenViewController

    #pragma mark viewDidLoad
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.time1 = [[TimeDataClass alloc] init];          //initialize time data class in the game screen view
    self.music = [[Music alloc] init];                  //initialize the music class in the game screen view
    self.score = [[ScoreDataClass alloc] init];         //initialize score data class in the game screen view
    
    
    self.Mole1Button.hidden = true;
    self.Mole2Button.hidden = true;
    self.Mole3Button.hidden = true;
    self.Mole4Button.hidden = true;
    self.Mole5Button.hidden = true;
    self.Mole6Button.hidden = true;
    self.Mole7Button.hidden = true;
    self.Mole8Button.hidden = true;
    self.Mole9Button.hidden = true;
    //hides all 9 ¨moles¨ buttons
    
    self.NoTimeLeftLabel.hidden = true;     //hides the NoTimeLeftLabel
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeleftminute = [defaults integerForKey:@"TimeLeftMinute"];     //sets the value of the variable timeleftminute to the value saved in the key @"TimeLeftMinute"
    self.time1.timeleftseconds = [defaults integerForKey:@"TimeLeftSeconds"];   //sets the value of the variable timeleftseconds to the value saved in the key @"TimeLeftSeconds"
    self.time1.starttime = [defaults integerForKey:@"StartTime"];               //sets the value of the variable starttime to the value saved in the key @"StartTime"
    self.time1.timeleft = [defaults integerForKey:@"TimeLeft"];                 //sets the value of the variable timeleft to the value saved in the key @"TimeLeft"
    self.difficulty = [defaults stringForKey:@"Difficulty"];


    NSLog(@"start time = %.0f",self.time1.starttime);

    if (self.time1.timeleftseconds == 0 & self.time1.timeleftminute >= 0) {     //if statement used to make sure the TimeLeftLabel displays the time, when the screen loads, as MINUTES:00 if the time is set as just minutes
            self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:00", (long)self.time1.timeleftminute];
        }
    else{
    self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
    }
    //display time set on the settings view

    self.score.highestscoreEasy = [defaults integerForKey:@"HighestScoreEasy"];     //sets the value of the variable highestscore to the value saved on the key @¨HighestScore¨
    self.score.highestscoreNormal = [defaults integerForKey:@"HighestScoreNormal"];     //sets the value of the variable highestscore to the value saved on the key @¨HighestScore¨
    self.score.highestscoreHard = [defaults integerForKey:@"HighestScoreHard"];     //sets the value of the variable highestscore to the value saved on the key @¨HighestScore¨
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Easy) = %li", (long)self.score.highestscoreEasy];
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Normal) = %li", (long)self.score.highestscoreNormal];
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Hard) = %li", (long)self.score.highestscoreHard];
    }
    
    //self.time1.timeMole = [defaults integerForKey:@"timeMole"];
    
    //starts the corresponding methods
    [self startMole1];
    [self startmole2];
    [self startMole3];
    [self startmole4];
    [self startMole5];
    [self startMole6];
    [self startmole7];
    [self startMole8];
    [self startmole9];
    [self.time1 startTimer];
    [self changeLabels];
    [self background];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark change labels methods

- (void) changeLabels {     //When the method is called an NSTimer will run the method ChangeTimeLeftLabel every second
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.time1.timeleftminute forKey:@"TimeLeftMinute"];
    [defaults synchronize];
    [defaults setInteger:self.time1.timeleftseconds forKey:@"TimeLeftSeconds"];
    [defaults synchronize];
    [defaults setInteger:self.time1.timeleft forKey:@"TimeLeft"];
    [defaults synchronize];
    [defaults setInteger:self.time1.starttime forKey:@"StartTime"];
    [defaults synchronize];
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimeLeftLabel) userInfo:nil repeats:YES];
    
}

-(void) changeTimeLeftLabel {

    self.time1.timeleft -= 1;       //self.time1.timeleft = self. time1.timeleft - 1

    
    if (self.time1.timeleftseconds >= 0 & self.time1.timeleftseconds < 10) {    //if else if function that will display the time in a certain way depending on wether the variable timeleft seconds is between 0 and 10 or not
        if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:0%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
        }
    }
    else if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
    }
    if (self.time1.timeleftseconds == 0) {      //if function that will display the time left in a certain way when th timeleftseconds variable is 0
        if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
            self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:00", (long)self.time1.timeleftminute];
        }
    }
    if (self.time1.timeleftminute == 0 & self.time1.timeleftseconds == 0) {     //When the time is 0 the Highest score will be displayed.
        if ([self.difficulty isEqualToString:@"Easy"]) {
            self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Easy) = %li", (long)self.score.highestscoreEasy];
            self.NoTimeLeftLabel.hidden = false;        //shows the NoTimeLeftLabel
            NSLog(@"%li", (long)self.score.highestscoreEasy);
        }
        else if ([self.difficulty isEqualToString:@"Normal"]) {
            self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Normal) = %li", (long)self.score.highestscoreNormal];
            self.NoTimeLeftLabel.hidden = false;        //shows the NoTimeLeftLabel
            NSLog(@"%li", (long)self.score.highestscoreNormal);
        }
        else if ([self.difficulty isEqualToString:@"Hard"]) {
            self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score(Hard) = %li", (long)self.score.highestscoreHard];
            self.NoTimeLeftLabel.hidden = false;        //shows the NoTimeLeftLabel
            NSLog(@"%li", (long)self.score.highestscoreHard);
        }
        
    }
    
}

#pragma mark Moles methods

-(void)startmole2{      //When the method is called an NSTimer will run the method StartMole2 during 2 seconds
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(startMole2) userInfo:nil repeats:NO];
}
-(void)startmole4{      //When the method is called an NSTimer will run the method StartMole4 during 4 seconds
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(startMole4) userInfo:nil repeats:NO];
}
-(void)startmole7{      //When the method is called an NSTimer will run the method StartMole7 during 3 seconds
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startMole7) userInfo:nil repeats:NO];
}
-(void)startmole9{      //When the method is called an NSTimer will run the method StartMole9 during 5 seconds
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(startMole9) userInfo:nil repeats:NO];
}

- (void) startMole1 {       //When the method is called an NSTimer will run the method Mole1 every certain time
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole1 = [defaults floatForKey:@"TimeMole1"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole1 target:self selector:@selector(Mole1) userInfo:nil repeats:YES];
    
}
- (void) startMole2 {       //When the method is called an NSTimer will run the method Mole2 every certain time
    if (self.time1.timeleft == self.time1.starttime - 1) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole2 = [defaults floatForKey:@"TimeMole2"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole2 target:self selector:@selector(Mole2) userInfo:nil repeats:YES];
    }
}
- (void) startMole3 {       //When the method is called an NSTimer will run the method Mole3 every certain time
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole3 = [defaults floatForKey:@"TimeMole3"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole3 target:self selector:@selector(Mole3) userInfo:nil repeats:YES];
    
}
- (void) startMole4 {       //When the method is called an NSTimer will run the method Mole4 every certain time
    if (self.time1.timeleft == self.time1.starttime - 3) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole4 = [defaults floatForKey:@"TimeMole4"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole4 target:self selector:@selector(Mole4) userInfo:nil repeats:YES];
    }
}
- (void) startMole5 {       //When the method is called an NSTimer will run the method Mole5 every certain time
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole5 = [defaults floatForKey:@"TimeMole5"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole5 target:self selector:@selector(Mole5) userInfo:nil repeats:YES];
    
}
- (void) startMole6 {       //When the method is called an NSTimer will run the method Mole6 every certain time
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole6 = [defaults floatForKey:@"TimeMole6"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole6 target:self selector:@selector(Mole6) userInfo:nil repeats:YES];
    
}
- (void) startMole7 {       //When the method is called an NSTimer will run the method Mole7 every certain time
    if (self.time1.timeleft == self.time1.starttime - 2) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole7 = [defaults floatForKey:@"TimeMole7"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole7 target:self selector:@selector(Mole7) userInfo:nil repeats:YES];
    }
}
- (void) startMole8 {       //When the method is called an NSTimer will run the method Mole8 every certain time
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole8 = [defaults floatForKey:@"TimeMole8"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole8 target:self selector:@selector(Mole8) userInfo:nil repeats:YES];
    
}
- (void) startMole9 {       //When the method is called an NSTimer will run the method Mole9 every certain time
    if (self.time1.timeleft == self.time1.starttime - 4) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole9 = [defaults floatForKey:@"TimeMole9"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole9 target:self selector:@selector(Mole9) userInfo:nil repeats:YES];
    }
}
-(void) Mole1 {     //When the method is called an the outlet Mole1Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole1Button.hidden == false){
        NSLog(@"Hide Mole1");
        self.Mole1Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole1");
        self.Mole1Button.hidden = false;
    }}}
-(void) Mole2 {     //When the method is called an the outlet Mole2Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole2Button.hidden == false){
        NSLog(@"Hide Mole2");
        self.Mole2Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole2");
        self.Mole2Button.hidden = false;
    }}}
-(void) Mole3 {     //When the method is called an the outlet Mole3Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole3Button.hidden == false){
        self.Mole3Button.hidden = true;
    }
    else {
        self.Mole3Button.hidden = false;
    }}}
-(void) Mole4 {     //When the method is called an the outlet Mole4Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole4Button.hidden == false){
        self.Mole4Button.hidden = true;
    }
    else {
        self.Mole4Button.hidden = false;
    }}}
-(void) Mole5 {     //When the method is called an the outlet Mole5Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole5Button.hidden == false){
        self.Mole5Button.hidden = true;
    }
    else {
        self.Mole5Button.hidden = false;
    }}}
-(void) Mole6 {     //When the method is called an the outlet Mole6Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole6Button.hidden == false){
        self.Mole6Button.hidden = true;
    }
    else {
        self.Mole6Button.hidden = false;
    }}}
-(void) Mole7 {     //When the method is called an the outlet Mole7Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole7Button.hidden == false){
        self.Mole7Button.hidden = true;
    }
    else {
        self.Mole7Button.hidden = false;
    }}}
-(void) Mole8 {     //When the method is called an the outlet Mole8Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole8Button.hidden == false){
        self.Mole8Button.hidden = true;
    }
    else {
        self.Mole8Button.hidden = false;
    }}}
-(void) Mole9 {     //When the method is called an the outlet Mole9Button will be hidden or showed depending on wether is already hidden or not
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole9Button.hidden == false){
        self.Mole9Button.hidden = true;
    }
    else {
        self.Mole9Button.hidden = false;
    }}}

#pragma mark moles buttons

- (IBAction)Mole1Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole1Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
        
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
    
}

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole2Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
        
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole3Button.hidden = true;                                                                 //hides the button
    
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
        
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole4Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
    
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole5Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class

    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole6Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
   
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole7Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
  
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole8Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class

    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                       //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole9Button.hidden = true;                                                                 //hides the button
    
        [self.music MoleWhack];                                                                         //calls the method MoleWhack in the music class
        
    }
    
    if ([self.difficulty isEqualToString:@"Easy"]) {
        [self.score HighestScoreEasy];                                                                          //calls the method HighestScoreEasy in the score class
    }
    else if ([self.difficulty isEqualToString:@"Normal"]) {
        [self.score HighestScoreNormal];                                                                          //calls the method HighestScoreNormal in the score class
    }
    else if ([self.difficulty isEqualToString:@"Hard"]) {
        [self.score HighestScoreHard];                                                                          //calls the method HighestScoreHard in the score class
    }
}

#pragma mark Back button

- (IBAction)BackToStart:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"BackFromGameScreen" sender:self];                                //When Back button is pressed it will take you to the Main Screen
    
}

#pragma mark background method

-(void) background {        //Method that will set the background image to Background_app.png + it will also autosize it to fill the sceen
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background_app.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //Learned how to do it using the following link https://stackoverflow.com/questions/8077740/how-to-fill-background-image-of-an-uiview
    
}
@end

