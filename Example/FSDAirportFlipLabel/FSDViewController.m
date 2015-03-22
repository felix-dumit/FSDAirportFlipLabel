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

@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation FSDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airportLabel.textSize = 14;
    self.airportLabel.useSound = YES;
    self.airportLabel.startedFlippingLabelsBlock = ^{ NSLog(@"started flipping"); };
    self.airportLabel.finishedFlippingLabelsBlock = ^{ NSLog(@"Stopped flipping"); };
    self.airportLabel.text = @"FSD Label";
    self.airportLabel.fixedLenght = 15;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabelText:(id)sender {
    self.airportLabel.text = self.textField.text;
}

@end
