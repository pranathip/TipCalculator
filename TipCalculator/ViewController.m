//
//  ViewController.m
//  TipCalculator
//
//  Created by Pranathi Peri on 6/23/20.
//  Copyright © 2020 Pranathi Peri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *pplControl;
@property (weak, nonatomic) IBOutlet UILabel *perPersonLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    // in java --> self.view.endEditing(YES);
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    NSArray *numppl = @[@(1), @(2), @(3), @(4), @(5)];
    double ppl = [numppl [self.pplControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    double perpersontotal = total/ppl;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    self.perPersonLabel.text = [NSString stringWithFormat:@"$%.2f", perpersontotal];
    
}

- (IBAction)onEditingBegin:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y +=10;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];

    
}
- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -=10;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];

    
    
}

@end
