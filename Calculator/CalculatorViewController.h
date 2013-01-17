//
//  CalculatorViewController.h
//  Calculator
//
//  Created by 佐々木　恵理子 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorStateMachine.h"

@interface CalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *labelc;

@property(readonly) CalculatorStateMachine* statemachine;

@property enum {nothing,sub,asta,slash,add} state;


- (IBAction)pushac:(id)sender;
- (IBAction)pushplumai:(id)sender;
- (IBAction)pushminus:(id)sender;
- (IBAction)pushasta:(id)sender;
- (IBAction)pushslash:(id)sender;
- (IBAction)pushplus:(id)sender;
- (IBAction)pushequal:(id)sender;
- (IBAction)pushperiod:(id)sender;
- (IBAction)push7:(id)sender;
- (IBAction)push8:(id)sender;
- (IBAction)push9:(id)sender;
- (IBAction)push4:(id)sender;
- (IBAction)push5:(id)sender;
- (IBAction)push6:(id)sender;
- (IBAction)push1:(id)sender;
- (IBAction)push2:(id)sender;
- (IBAction)push3:(id)sender;
- (IBAction)push0:(id)sender;

@end
