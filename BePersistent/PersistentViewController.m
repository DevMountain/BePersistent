//
//  PersistentViewController.m
//  BePersistent
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PersistentViewController.h"

static NSString * const scoreKey = @"score";

@interface PersistentViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;

@end

@implementation PersistentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;

    NSNumber *score = [[NSUserDefaults standardUserDefaults] objectForKey:scoreKey];
    
    if (score) {
        self.scoreLabel.text = [score stringValue];
        self.stepper.value = [score doubleValue];
    }
    
}

- (IBAction)changeScore:(id)sender {

    self.scoreLabel.text = [NSString stringWithFormat:@"%.0f",[self.stepper value]];
    
}

- (IBAction)save:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:@(self.stepper.value) forKey:scoreKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
