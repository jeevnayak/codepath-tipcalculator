//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Rajeev Nayak on 5/8/14.
//  Copyright (c) 2014 jeev. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *defaultTipPicker;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    // preselect the current default tip percentage
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"default_tip_index"];
    [self.defaultTipPicker selectRow:defaultTipIndex inComponent:0 animated:NO];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *tipValues = @[@"10%", @"15%", @"20%"];
    return [tipValues objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // save the index of the selected tip percentage
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:row forKey:@"default_tip_index"];
    [defaults synchronize];
}

@end
