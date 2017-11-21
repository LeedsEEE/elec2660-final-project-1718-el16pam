//
//  SettingsScreenViewController.m
//  Whack-a-mole
//
//  Created by Pablo Albaladejo Munoz [el16pam] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SettingsScreenViewController.h"
#import "Time.h"
@interface SettingsScreenViewController ()

@end

@implementation SettingsScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.TimePickerView.delegate = self;
    self.TimePickerView.dataSource = self;
    
    self.time = [[Time alloc] init];
    
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

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;{
    
    NSString *number = [NSString stringWithFormat:@"%ld", row];
    
    return number;
    
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component;{
    
    self.FirstSignificantFigure = [self.TimePickerView selectedRowInComponent:0];
    self.SecondSignificantFigure = [self.TimePickerView selectedRowInComponent:1];
    self.ThirdSignificantFigure = [self.TimePickerView selectedRowInComponent:2];
    
    self.time.timeselected = self.FirstSignificantFigure*100 + self.SecondSignificantFigure*10 + self.ThirdSignificantFigure;
    
    self.TimeSelectedLabel.text = [NSString stringWithFormat:@"Time = %.0fs", self.time.timeselected];
    
}

#pragma mark PikerView Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;{
    
    return 3;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
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
}

- (IBAction)NormalButtonPressed:(UIButton *)sender {
}

- (IBAction)HardButtonPressed:(UIButton *)sender {
}

- (IBAction)BackToStartButton:(UIButton *)sender {
}
@end
