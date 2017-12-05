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
    self.music = [[Music alloc] init];
    //initialize the music class in the game screen view
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
    self.time1.timeleftminute = [defaults integerForKey:@"TimeLeftMinute"];
    self.time1.timeleftseconds = [defaults integerForKey:@"TimeLeftSeconds"];
    self.time1.starttime = [defaults integerForKey:@"StartTime"];
    self.time1.timeleft = [defaults integerForKey:@"TimeLeft"];

    NSLog(@"%.0f",self.time1.starttime);

    
    self.time1.timeMole1 = [defaults integerForKey:@"TimeMole1"];
    self.time1.timeMole2 = [defaults integerForKey:@"TimeMole2"];
    if (self.time1.timeleftseconds == 0 & self.time1.timeleftminute >= 0) {
            self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:00", (long)self.time1.timeleftminute];
        }
    else{
    self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
    }
    //display time set on the settings view

    self.score.highestscore = [defaults integerForKey:@"HighestScore"];
    self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
    
    //self.time1.timeMole = [defaults integerForKey:@"timeMole"];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*- (void) startMole1 {
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(Mole1t) userInfo:nil repeats:YES];
    
}*/
-(void)startmole2{
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(startMole2) userInfo:nil repeats:NO];
}
-(void)startmole4{
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(startMole4) userInfo:nil repeats:NO];
}
-(void)startmole7{
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(startMole7) userInfo:nil repeats:NO];
}
-(void)startmole9{
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(startMole9) userInfo:nil repeats:NO];
}

- (void) changeLabels {
    
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

    self.time1.timeleft -=1;

    
    if (self.time1.timeleftseconds >= 0 & self.time1.timeleftseconds < 10) {
        if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:0%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
        }
    }
    else if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
        self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:%ld", (long)self.time1.timeleftminute, (long)self.time1.timeleftseconds];
    }
    if (self.time1.timeleftseconds == 0) {
        if (self.time1.timeleftseconds >= 0 | self.time1.timeleftminute >= 0) {
            self.TimeLeftLabel.text = [NSString stringWithFormat:@"Time Left = %li:00", (long)self.time1.timeleftminute];
        }
    }
    if (self.time1.timeleftminute == 0 & self.time1.timeleftseconds == 0) {
        self.HighestScoreLabel.text = [NSString stringWithFormat:@"Highest Score = %li", (long)self.score.highestscore];
        self.NoTimeLeftLabel.hidden = false;
    }
}


- (void) startMole1 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole1 = [defaults floatForKey:@"TimeMole1"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole1 target:self selector:@selector(Mole1) userInfo:nil repeats:YES];
    
}
- (void) startMole2 {
    if (self.time1.timeleft == self.time1.starttime - 1) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole2 = [defaults floatForKey:@"TimeMole2"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole2 target:self selector:@selector(Mole2) userInfo:nil repeats:YES];
    }
}
- (void) startMole3 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole3 = [defaults floatForKey:@"TimeMole3"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole3 target:self selector:@selector(Mole3) userInfo:nil repeats:YES];
    
}
- (void) startMole4 {
    if (self.time1.timeleft == self.time1.starttime - 3) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole4 = [defaults floatForKey:@"TimeMole4"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole4 target:self selector:@selector(Mole4) userInfo:nil repeats:YES];
    }
}
- (void) startMole5 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole5 = [defaults floatForKey:@"TimeMole5"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole5 target:self selector:@selector(Mole5) userInfo:nil repeats:YES];
    
}
- (void) startMole6 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole6 = [defaults floatForKey:@"TimeMole6"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole6 target:self selector:@selector(Mole6) userInfo:nil repeats:YES];
    
}
- (void) startMole7 {
    if (self.time1.timeleft == self.time1.starttime - 2) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole7 = [defaults floatForKey:@"TimeMole7"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole7 target:self selector:@selector(Mole7) userInfo:nil repeats:YES];
    }
}
- (void) startMole8 {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole8 = [defaults floatForKey:@"TimeMole8"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole8 target:self selector:@selector(Mole8) userInfo:nil repeats:YES];
    
}
- (void) startMole9 {
    if (self.time1.timeleft == self.time1.starttime - 4) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.time1.timeMole9 = [defaults floatForKey:@"TimeMole9"];
    
    self.time1.timer = [NSTimer scheduledTimerWithTimeInterval:self.time1.timeMole9 target:self selector:@selector(Mole9) userInfo:nil repeats:YES];
    }
}
-(void) Mole1 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole1Button.hidden == false){
        NSLog(@"Hide Mole1");
        self.Mole1Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole1");
        self.Mole1Button.hidden = false;
    }}}
-(void) Mole2 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole2Button.hidden == false){
        NSLog(@"Hide Mole2");
        self.Mole2Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole2");
        self.Mole2Button.hidden = false;
    }}}
-(void) Mole3 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole3Button.hidden == false){
        NSLog(@"Hide Mole3");
        self.Mole3Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole3");
        self.Mole3Button.hidden = false;
    }}}
-(void) Mole4 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole4Button.hidden == false){
        NSLog(@"Hide Mole4");
        self.Mole4Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole4");
        self.Mole4Button.hidden = false;
    }}}
-(void) Mole5 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole5Button.hidden == false){
        NSLog(@"Hide Mole5");
        self.Mole5Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole5");
        self.Mole5Button.hidden = false;
    }}}
-(void) Mole6 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole6Button.hidden == false){
        NSLog(@"Hide Mole6");
        self.Mole6Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole6");
        self.Mole6Button.hidden = false;
    }}}
-(void) Mole7 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole7Button.hidden == false){
        NSLog(@"Hide Mole7");
        self.Mole7Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole7");
        self.Mole7Button.hidden = false;
    }}}
-(void) Mole8 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole8Button.hidden == false){
        NSLog(@"Hide Mole8");
        self.Mole8Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole8");
        self.Mole8Button.hidden = false;
    }}}
-(void) Mole9 {
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
    if (self.Mole9Button.hidden == false){
        NSLog(@"Hide Mole9");
        self.Mole9Button.hidden = true;
    }
    else {
        NSLog(@"Show Mole9");
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
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole1Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];
        
    }
    
    [self.score HighestScore];
    
    
}

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {
        
        self.score.currentscore = self.score.currentscore + 1;                                          //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole2Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];
        
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

        self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole3Button.hidden = true;                                                                 //hides the button
    
        [self.music MoleWhack];
        
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole4Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];
    
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole5Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];

    }
    
    [self.score HighestScore];
}

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole6Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];
   
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole7Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];
  
    }
    
    [self.score HighestScore];
}

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole8Button.hidden = true;                                                                 //hides the button
        
        [self.music MoleWhack];

    }
    
    [self.score HighestScore];
}

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    if (self.time1.timeleftminute > 0 | self.time1.timeleftseconds > 0) {

    self.score.currentscore += 1;                                                                   //increase current score if button pressed and showed
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];      //updates the score label
        self.Mole9Button.hidden = true;                                                                 //hides the button
    
        [self.music MoleWhack];
        
    }
    
    [self.score HighestScore];
}

- (IBAction)BackToStart:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"BackFromGameScreen" sender:self];                                        //When Back button is pressed it will take you to the Main Screen
    
}

-(void) background {
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background_apppremoles.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image]; //https://stackoverflow.com/questions/8077740/how-to-fill-background-image-of-an-uiview
    
}
@end

