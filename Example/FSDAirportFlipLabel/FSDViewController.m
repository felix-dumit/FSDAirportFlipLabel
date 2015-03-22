//
//  FSDViewController.m
//  FSDAirportFlipLabel
//
//  Created by Felix Dumit on 03/16/2015.
//  Copyright (c) 2014 Felix Dumit. All rights reserved.
//

#import <FSDAirportFlipLabel.h>
#import "FSDViewController.h"

@interface FSDViewController ()
@property (weak, nonatomic) IBOutlet FSDAirportFlipLabel *airportLabel;

@property (weak, nonatomic) IBOutlet UIButton *changeButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation FSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airportLabel.textSize = 14;
    self.airportLabel.useSound = YES;
    self.airportLabel.fixedLenght = 15;
    self.airportLabel.flipTextColor = [UIColor whiteColor];
    self.airportLabel.flipBackGroundColor = [UIColor blackColor];
    __weak __typeof(self) weakSelf = self;
    
    self.airportLabel.startedFlippingLabelsBlock = ^{
        weakSelf.changeButton.enabled = NO;
        NSLog(@"started flipping");
    };
    self.airportLabel.finishedFlippingLabelsBlock = ^{
        weakSelf.changeButton.enabled = YES;
        NSLog(@"Stopped flipping");
    };
    
    self.airportLabel.text = @"FSD Flight 2022";
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeLabelText:(id)sender {
    self.airportLabel.text = self.textField.text;
}

@end
