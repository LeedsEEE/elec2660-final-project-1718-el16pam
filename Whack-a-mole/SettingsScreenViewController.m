//
//  SettingsScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

//To learn how to use NSUserDefaults i used the following link http://www.ios-blog.co.uk/tutorials/objective-c/storing-data-with-nsuserdefaults/

#import "SettingsScreenViewController.h"
#import "TimeDataClass.h"
@interface SettingsScreenViewController ()

@end

@implementation SettingsScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.TimePickerView.delegate = self;
    self.TimePickerView.dataSource = self;
    
    self.time = [[TimeDataClass alloc] init];       //initialize time data class in the settings screen view
    self.game = [[GameScreenViewController alloc] init];        //initialize game screen view controller in the settings screen view
    
    [self.TimePickerView selectRow:1 inComponent:0 animated:YES];       //sets the the row in the first component
    //I found how to do this in the following link: https://stackoverflow.com/questions/11777072/how-to-set-a-default-value-of-a-uipickerview
    self.TimeSelectedLabel.text = @"Time = 1:00";
    self.TickEasyImage.hidden = false;
    self.TickNormalImage.hidden = true;
    self.TickHardImage.hidden = true;

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

#pragma mark PikerView Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView     //Sets the number in each row equal to the row number
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;{
    NSString *number;
    if (component != 1) {
        number = [NSString stringWithFormat:@"%ld", (long)row];
    }
    else {
        number = [NSString stringWithFormat:@":"];
    }
    
    return number;
    
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;{
    
    self.time.minute = [self.TimePickerView selectedRowInComponent:0];                       //Gets the third significant figure of the time from the picker
    self.FirstSignificantFigure = [self.TimePickerView selectedRowInComponent:2];       //Gets the first significant figure of the time from the picker
    self.SecondSignificantFigure = [self.TimePickerView selectedRowInComponent:3];      //Gets the second significant figure of the time from the picker
    
    if (self.time.minute == 5) {
        self.FirstSignificantFigure = 0;
        [self.TimePickerView selectRow:0 inComponent:2 animated:YES];
    }
    else if (self.time.minute == 0 & self.FirstSignificantFigure == 0) {
        self.FirstSignificantFigure = 1;
        [self.TimePickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    self.time.seconds = self.FirstSignificantFigure*10 + self.SecondSignificantFigure;
    self.time.timeselected = self.time.minute*60 + self.FirstSignificantFigure*10 + self.SecondSignificantFigure;       //Calculates the time selected using the values extracted from the picker
    
    NSLog(@"time selected = %.0f", self.time.timeselected);
    if (self.FirstSignificantFigure == 0){
        
        self.TimeSelectedLabel.text = [NSString stringWithFormat:@"Time = %li:00", (long)self.time.minute];      //Displays the Time Selected
        
    }
    else {
    self.TimeSelectedLabel.text = [NSString stringWithFormat:@"Time = %li:%ld", (long)self.time.minute, (long)self.time.seconds];      //Displays the Time Selected
    
    }
    
   
    
}

#pragma mark PikerView Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;{
    
    return 4;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView      //Sets the number of rows for each component
numberOfRowsInComponent:(NSInteger)component;{
    
    if (component == 0) {
        self.rows = 6;
    }
    else if (component == 1) {
        self.rows = 1;
    }
    else if (component == 2) {
        self.rows = 6;
    }
    else {
        self.rows = 1;
    }
    
    return self.rows;

}

- (IBAction)EasyButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = false;      //Shows the tick next to the Easy button
    self.TickNormalImage.hidden = true;     //Hides the tick next to the Normal Button
    self.TickHardImage.hidden = true;       //Hides the tick next to the Hard Button
    
    /*self.time.timeMole1Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole2Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole3Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole4Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole5Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole6Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole7Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole8Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    self.time.timeMole9Showed = ((arc4random_uniform(110) + 250.0f)/100.0f);
    
    self.time.timeMole1Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole2Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole3Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole4Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole5Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole6Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole7Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole8Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);
    self.time.timeMole9Hidden = ((arc4random_uniform(501) + 750.0f)/100.0f);*/
    
    self.time.timeMole1 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole2 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole3 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole4 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole5 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole6 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole7 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole8 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    self.time.timeMole9 = ((arc4random_uniform(251) + 250.0f)/100.0f);
    
    
    NSLog(@"time selected for Mole1 = %.2f", self.time.timeMole1);
    NSLog(@"time selected for Mole2 = %.2f", self.time.timeMole2);
}
- (IBAction)NormalButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = true;       //Hides the tick next to the Easy button
    self.TickNormalImage.hidden = false;    //Shows the tick next to the Normal button
    self.TickHardImage.hidden = true;       //Hides the tick next to the Hard button
    
    /*self.time.timeMole1Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole2Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole3Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole4Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole5Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole6Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole7Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole8Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    self.time.timeMole9Showed = ((arc4random_uniform(110) + 150.0f)/100.0f);
    
    self.time.timeMole1Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole2Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole3Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole4Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole5Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole6Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole7Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole8Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);
    self.time.timeMole9Hidden = ((arc4random_uniform(501) + 400.0f)/100.0f);*/
    
    self.time.timeMole1 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole2 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole3 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole4 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole5 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole6 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole7 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole8 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    self.time.timeMole9 = ((arc4random_uniform(251) + 150.0f)/100.0f);
    
    NSLog(@"time selected for Mole1 = %.2f", self.time.timeMole1);
    NSLog(@"time selected for Mole2 = %.2f", self.time.timeMole2);
}

- (IBAction)HardButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = true;       //Hides the tick next to the Easy button
    self.TickNormalImage.hidden = true;     //Hides the tick next to the Normal button
    self.TickHardImage.hidden = false;      //Shows the tick next to the Hard button
    
   /* self.time.timeMole1Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole2Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole3Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole4Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole5Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole6Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole7Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole8Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    self.time.timeMole9Showed = ((arc4random_uniform(110) + 50.0f)/100.0f);
    
    self.time.timeMole1Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole2Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole3Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole4Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole5Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole6Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole7Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole8Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);
    self.time.timeMole9Hidden = ((arc4random_uniform(501) + 100.0f)/100.0f);*/

    self.time.timeMole1 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole2 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole3 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole4 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole5 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole6 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole7 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole8 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    self.time.timeMole9 = ((arc4random_uniform(251) + 50.0f)/100.0f);
    
    NSLog(@"time selected for Mole1 = %.2f", self.time.timeMole1);
    NSLog(@"time selected for Mole2 = %.2f", self.time.timeMole2);
    
   }

- (IBAction)SaveButton:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.time.timeselected != 0){
    self.time.timeleftminute = self.time.minute;        //Sets the variable timeleft to the time selected when the save button is pressed
    self.time.timeleftseconds = self.time.seconds;
    self.time.starttime = self.time.timeselected;
    self.time.timeleft = self.time.timeselected;
    }
    else {
        self.time.timeleftminute = 1;
        self.time.starttime = 60;
        self.time.timeleft = 60;
    }
    NSLog(@"Time = %li:%ld", (long)self.time.minute, (long)self.time.seconds);
    [defaults setInteger:self.time.timeleftminute forKey:@"TimeLeftMinute"];
    [defaults synchronize];
    [defaults setInteger:self.time.timeleftseconds forKey:@"TimeLeftSeconds"];
    [defaults synchronize];
    [defaults setInteger:self.time.starttime forKey:@"StartTime"];
    [defaults synchronize];
    [defaults setInteger:self.time.timeleft forKey:@"TimeLeft"];
    [defaults synchronize];
    
    if (self.time.timeMole1 != 0){
        
    [defaults setFloat:self.time.timeMole1 forKey:@"TimeMole1"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole2 forKey:@"TimeMole2"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole3 forKey:@"TimeMole3"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole4 forKey:@"TimeMole4"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole5 forKey:@"TimeMole5"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole6 forKey:@"TimeMole6"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole7 forKey:@"TimeMole7"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole8 forKey:@"TimeMole8"];
    [defaults synchronize];
    [defaults setFloat:self.time.timeMole9 forKey:@"TimeMole9"];
    [defaults synchronize];
    }
    else {
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole1"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole2"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole3"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole4"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole5"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole6"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole7"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole8"];
    [defaults synchronize];
    [defaults setFloat:((arc4random_uniform(251) + 250.0f)/100.0f) forKey:@"TimeMole9"];
    [defaults synchronize];
    }
}

- (IBAction)BackToStart:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"BackFromSettingsScreen" sender:self];                                        //When Back button is pressed it will take you to the Main Screen
    
}

-(void) background {
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Background_app.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image]; //https://stackoverflow.com/questions/8077740/how-to-fill-background-image-of-an-uiview
    
}
@end

