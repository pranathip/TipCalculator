//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Pranathi Peri on 6/23/20.
//  Copyright © 2020 Pranathi Peri. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTip;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onEdit:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double defTip = [self.defaultTip.text doubleValue];
    [defaults setDouble:defTip forKey:@"default_tip_percentage"];
    [defaults synchronize];

}
- (IBAction)onEditingBegin:(id)sender {
    CGRect newFrame = self.defaultTip.frame;
    newFrame.origin.y +=10;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.defaultTip.frame = newFrame;
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    
    CGRect newFrame = self.defaultTip.frame;
    newFrame.origin.y -=10;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.defaultTip.frame = newFrame;
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
