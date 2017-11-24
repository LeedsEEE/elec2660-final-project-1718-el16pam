//
//  GameScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "GameScreenViewController.h"

@interface GameScreenViewController ()

@end

@implementation GameScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.time = [[TimeDataClass alloc] init];
    self.score = [[ScoreDataClass alloc] init];
    
    self.Mole1Button.hidden = true;
    self.Mole2Button.hidden = true;
    self.Mole3Button.hidden = true;
    self.Mole4Button.hidden = true;
    self.Mole5Button.hidden = true;
    self.Mole6Button.hidden = true;
    self.Mole7Button.hidden = true;
    self.Mole8Button.hidden = true;
    self.Mole9Button.hidden = true;
    
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

-(void) timerFire:(NSTimer *)timer {
    NSLog(@"Hide Button");
    self.Mole1Button.hidden = true;
}

- (IBAction)Mole1Pressed:(UIButton *)sender {
    
    if (self.Mole1Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
        
        self.time.timer = [NSTimer scheduledTimerWithTimeInterval: self.time.timeMoleHidden target:self selector:@selector(timerFire:) userInfo:nil repeats:NO];
        
    }
    
    
}

- (IBAction)Mole2Pressed:(UIButton *)sender {
    
    if (self.Mole2Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole3Pressed:(UIButton *)sender {
    
    if (self.Mole3Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole4Pressed:(UIButton *)sender {
    
    if (self.Mole4Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole5Pressed:(UIButton *)sender {
    
    if (self.Mole5Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole6Pressed:(UIButton *)sender {
    
    if (self.Mole6Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole7Pressed:(UIButton *)sender {
    
    if (self.Mole7Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole8Pressed:(UIButton *)sender {
    
    if (self.Mole8Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)Mole9Pressed:(UIButton *)sender {
    
    if (self.Mole9Button.hidden == false) {
        self.score.currentscore = self.score.currentscore + 1;
        self.ScoreLabel.text = [NSString stringWithFormat:@"Score = %d", self.score.currentscore];
    }
}

- (IBAction)BackToStartPressed:(UIButton *)sender {
}
@end
