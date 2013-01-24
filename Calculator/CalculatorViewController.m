//
//  CalculatorViewController.m
//  Calculator
//
//  Created by 佐々木　恵理子 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import "CalculatorViewController.h"


@interface CalculatorViewController () {
}
@end

@implementation CalculatorViewController

@synthesize state;
@synthesize statemachine;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //xcodeを開いたとき必ず参照する
    
    statemachine = [[CalculatorStateMachine alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////  AC  /////////////////
- (IBAction)pushac:(id)sender {
    [statemachine pushac];
    [[self label] setText:[NSString stringWithFormat:@"%g",[statemachine output]]];
    [[self labelc] setText:@""];
}

////////////////  +-  /////////////////
- (IBAction)pushplumai:(id)sender {
    [statemachine pushplumai];
    [[self label] setText:[NSString stringWithFormat:@"%c%g",[statemachine moji],[statemachine output]]];
}

/////////////////  -  ////////////////
- (IBAction)pushminus:(id)sender {
    [[self label] setText:[statemachine calculate:sub]];
    [[self labelc] setText:[NSString stringWithFormat:@"%g -",[statemachine suboutput]]];
}

////////////////  *  /////////////////
- (IBAction)pushasta:(id)sender {
    [[self label] setText:[statemachine calculate:asta]];
//    [statemachine calculate:asta];
    [[self labelc] setText:[NSString stringWithFormat:@"%g *",[statemachine suboutput]]];
}

/////////////////  /  ////////////////
- (IBAction)pushslash:(id)sender{
    [[self label] setText:[statemachine calculate:slash]];
    [[self labelc] setText:[NSString stringWithFormat:@"%g /",[statemachine suboutput]]];
}

/////////////////  +  ////////////////
- (IBAction)pushplus:(id)sender{
    [[self label] setText:[statemachine calculate:add]];
    [[self labelc] setText:[NSString stringWithFormat:@"%g +",[statemachine suboutput ]]];
}

/////////////////  =  ///////////////
- (IBAction)pushequal:(id)sender{
    [[self label] setText:[statemachine pushequal]];
    [[self labelc] setText:@""];
}

////////////////  .  ////////////////
- (IBAction)pushperiod:(id)sender{
    [statemachine pushperiod];
    [[self label] setText:[NSString stringWithFormat:@"%c%g.",[statemachine moji],[statemachine output]]];
}

////////////////  7  //////////////
- (IBAction)push7:(id)sender{
    [[self label] setText:[statemachine push:7]];
    
}

////////////////  8  //////////////
- (IBAction)push8:(id)sender{
    [[self label] setText:[statemachine push:8]];
}

////////////////  9  /////////////
- (IBAction)push9:(id)sender{
    [[self label] setText:[statemachine push:9]];
}

////////////////  4  //////////////
- (IBAction)push4:(id)sender{
    [[self label] setText:[statemachine push:4]];
}

/////////////////  5  /////////////
- (IBAction)push5:(id)sender{
    [[self label] setText:[statemachine push:5]];
}

////////////////  6  //////////////
- (IBAction)push6:(id)sender{
    [[self label] setText:[statemachine push:6]];
}

////////////////  1  //////////////
- (IBAction)push1:(id)sender{
    [[self label] setText:[statemachine push:1]];
}

////////////////  2  //////////////
- (IBAction)push2:(id)sender{
    [[self label] setText:[statemachine push:2]];
}

/////////////////  3  /////////////
- (IBAction)push3:(id)sender{
    [[self label] setText:[statemachine push:3]];
}

////////////////  0  //////////////
- (IBAction)push0:(id)sender{
    [[self label] setText:[statemachine push:0]];
}

@end
