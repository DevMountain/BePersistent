//
//  PersistentViewController.m
//  BePersistent
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PersistentViewController.h"

static NSString * const playerKey = @"player";
static NSString * const scoreKey = @"score";
static NSString * const playerNameKey = @"playerName";

@interface PersistentViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UIStepper *stepper;
@property (nonatomic, strong) IBOutlet UILabel *scoreLabel;

@end

@implementation PersistentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField.delegate = self;

    NSDictionary *player = [[NSUserDefaults standardUserDefaults] objectForKey:playerKey];
    [self updateWithDictionary:player];
}

- (void)updateWithDictionary:(NSDictionary *)dictionary {

    NSNumber *score = dictionary[scoreKey];
    
    if (score) {
        self.scoreLabel.text = [score stringValue];
        self.stepper.value = [score doubleValue];
    }
    
    NSString *name = dictionary[playerNameKey];
    
    if (name) {
        self.textField.text = name;
    }
}

- (IBAction)changeScore:(id)sender {

    self.scoreLabel.text = [NSString stringWithFormat:@"%.0f",[self.stepper value]];
    
}

- (IBAction)save:(id)sender {
    
    NSMutableDictionary *player = [NSMutableDictionary new];
    [player setObject:@(self.stepper.value) forKey:scoreKey];
    if (self.textField.text) {
        [player setObject:self.textField.text forKey:playerNameKey];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:player forKey:playerKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
