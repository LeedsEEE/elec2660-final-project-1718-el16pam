//
//  SettingsScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

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
    
    self.time = [[TimeDataClass alloc] init];
    
    [self.TimePickerView selectRow:1 inComponent:0 animated:YES];
    [self.TimePickerView selectRow:2 inComponent:1 animated:YES];
    //I found how to do this in the following link: https://stackoverflow.com/questions/11777072/how-to-set-a-default-value-of-a-uipickerview
    self.TimeSelectedLabel.text = @"Time = 120s";
    self.TickEasyImage.hidden = false;
    self.TickNormalImage.hidden = true;
    self.TickHardImage.hidden = true;

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

- (NSString *)pickerView:(UIPickerView *)pickerView                                                                             //Sets the number in each row equal to the row number
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;{
    
    NSString *number = [NSString stringWithFormat:@"%ld", row];
    
    return number;
    
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;{
    
    self.FirstSignificantFigure = [self.TimePickerView selectedRowInComponent:0];                                               //Gets the first significant figure of the time from the picker
    self.SecondSignificantFigure = [self.TimePickerView selectedRowInComponent:1];                                              //Gets the second significant figure of the time from the picker
    self.ThirdSignificantFigure = [self.TimePickerView selectedRowInComponent:2];                                               //Gets the third significant figure of the time from the picker
    
    self.time.timeselected = self.FirstSignificantFigure*100 + self.SecondSignificantFigure*10 + self.ThirdSignificantFigure;   //Calculates the time selected using the values extracted from the picker
    
    self.TimeSelectedLabel.text = [NSString stringWithFormat:@"Time = %.0fs", self.time.timeselected];                          //Displays the Time Selected
    
}

#pragma mark PikerView Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;{
    
    return 3;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView                                                                              //Sets the number of rows for each component
numberOfRowsInComponent:(NSInteger)component;{
    
    if (component == 0) {
        self.rows = 5;
    }
    else if (component == 1) {
        self.rows = 10;
    }
    else {
        self.rows = 1;
    }
    
    return self.rows;

}

- (IBAction)EasyButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = false;                                                                                          //Shows the tick next to the Easy button
    self.TickNormalImage.hidden = true;                                                                                         //Hides the tick next to the Normal Button
    self.TickHardImage.hidden = true;                                                                                           //Hides the tick next to the Hard Button
    
    self.difficulty = @"Easy";                                                                                                  //Sets the difficulty variable to "Easy"
    self.time.timeMoleHidden = 5;
    self.time.timeMoleShowed = 4;
    
}

- (IBAction)NormalButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = true;                                                                                           //Hides the tick next to the Easy button
    self.TickNormalImage.hidden = false;                                                                                        //Shows the tick next to the Normal button
    self.TickHardImage.hidden = true;                                                                                           //Hides the tick next to the Hard button
    
    self.difficulty = @"Normal";                                                                                                //Sets the difficulty variable to "Normal"
    self.time.timeMoleHidden = 3;
    self.time.timeMoleShowed = 2;
}

- (IBAction)HardButtonPressed:(UIButton *)sender {
    
    self.TickEasyImage.hidden = true;                                                                                           //Hides the tick next to the Easy button
    self.TickNormalImage.hidden = true;                                                                                         //Hides the tick next to the Normal button
    self.TickHardImage.hidden = false;                                                                                          //Shows the tick next to the Hard button
    
    self.difficulty = @"Hard";                                                                                                  //Sets the difficulty variable to "Hard"
    self.time.timeMoleHidden = 1.5;
    self.time.timeMoleShowed = 1;
}

- (IBAction)BackToStartButton:(UIButton *)sender {
}

@end

