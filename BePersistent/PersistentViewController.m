//
//  PersistentViewController.m
//  BePersistent
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PersistentViewController.h"

@interface PersistentViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;

@end

@implementation PersistentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;

}

- (IBAction)changeScore:(id)sender {

    self.scoreLabel.text = [NSString stringWithFormat:@"%.0f",[self.stepper value]];
    
}

- (IBAction)save:(id)sender {

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
