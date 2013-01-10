//
//  CalculatorViewController.m
//  Calculator
//
//  Created by 佐々木　恵理子 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import "CalculatorViewController.h"


@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

@synthesize state;
@synthesize statemachine;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

char moji=' ';
double n=0;
double m=0;
int M=0; //　マイナス表示
int D=0; //  小数点の有無
int d=0;

////////////////  AC  /////////////////
- (IBAction)pushac:(id)sender {
    n=0;
    m=0;
    state=nothing;
    D=0;
    d=0;
    M=0;
    moji=' ';
    [[self label] setText:[NSString stringWithFormat:@"%g",n]];
    [[self labelc] setText:@""];
}

////////////////  +-  /////////////////
- (IBAction)pushplumai:(id)sender {
    M=1;
    moji='-';
    [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
}

////////////  calculate関数  ///////////
-(void)calculate:(int)mark{
    if(M==1){
        n=-n;
    }
    if(state==nothing){
        m=n;
    }
    else{
        [self switches:state];
    }
    state=mark;
    n=0;
    D=0;
    d=0;
    M=0;
    moji=' ';
    [[self label] setText:[NSString stringWithFormat:@"%g",n]];
}

/////////////  switches  /////////////
-(void)switches:(int)C{
    switch(C){
        case add:
            m=m+n;
            break;
        case sub:
            m=m-n;
            break;
        case asta:
            m=m*n;
            break;
        case slash:
            m=m/n;
            break;
    }
}

/////////////////  -  ////////////////
- (IBAction)pushminus:(id)sender {
    [self calculate:sub];
    [[self labelc] setText:[NSString stringWithFormat:@"%g -",m]];
}

////////////////  *  /////////////////
- (IBAction)pushasta:(id)sender {
    [self calculate:asta];
    [[self labelc] setText:[NSString stringWithFormat:@"%g *",m]];
}

/////////////////  /  ////////////////
- (IBAction)pushslash:(id)sender{
    [self calculate:slash];
    [[self labelc] setText:[NSString stringWithFormat:@"%g /",m]];
}

/////////////////  +  ////////////////
- (IBAction)pushplus:(id)sender{
    [self calculate:add];
    [[self labelc] setText:[NSString stringWithFormat:@"%g +",m]];
}

/////////////////  =  ///////////////
- (IBAction)pushequal:(id)sender{
    if(M==1){
        n=-n;
    }
    
    [self switches:state];
    
    n=m;
    [[self label] setText:[NSString stringWithFormat:@"%g",n]];
    m=0;
    [[self labelc] setText:@""];
    state=nothing;
    D=0;
    d=0;
    M=0;
    moji=' ';
}

////////////////  .  ////////////////
- (IBAction)pushperiod:(id)sender{
    D=1;
        [[self label] setText:[NSString stringWithFormat:@"%c%g.",moji,n]];
}

/////////////  dot関数  /////////////
-(void)dot:(int)number{
    if (number==0) {
        switch (d) {
            case 1:
                [[self label] setText:[NSString stringWithFormat:@"%c%.1f",moji,n]];
                break;
            case 2:
                [[self label] setText:[NSString stringWithFormat:@"%c%.2f",moji,n]];
                break;
            case 3:
                [[self label] setText:[NSString stringWithFormat:@"%c%.3f",moji,n]];
                break;
            case 4:
                [[self label] setText:[NSString stringWithFormat:@"%c%.4f",moji,n]];
                break;
            case 5:
                [[self label] setText:[NSString stringWithFormat:@"%c%.5f",moji,n]];
                break;
            case 6:
                [[self label] setText:[NSString stringWithFormat:@"%c%.6f",moji,n]];
                break;
        }
    }
    else{
        [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
    }
}

//////////////  push関数  ////////////
- (void)push:(int) number
{
    if(D==1){
        d=d+1;
        n=n+number*pow(0.1,d);
        [self dot:number];
        return;
    }
    else{
            n=n*10+number;
            [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
    }
}

////////////////  7  //////////////
- (IBAction)push7:(id)sender{
    [self push:7];
    [[self label] setText:[statemachine push:7]];
}

////////////////  8  //////////////
- (IBAction)push8:(id)sender{
    [self push:8];
    [[self label] setText:[statemachine push:8]];
}

////////////////  9  /////////////
- (IBAction)push9:(id)sender{
    [self push:9];
    [[self label] setText:[statemachine push:9]];
}

////////////////  4  //////////////
- (IBAction)push4:(id)sender{
    [self push:4];
    [[self label] setText:[statemachine push:4]];
}

/////////////////  5  /////////////
- (IBAction)push5:(id)sender{
    [self push:5];
    [[self label] setText:[statemachine push:5]];
}

////////////////  6  //////////////
- (IBAction)push6:(id)sender{
    [self push:6];
    [[self label] setText:[statemachine push:6]];
}

////////////////  1  //////////////
- (IBAction)push1:(id)sender{
    [self push:1];
    [[self label] setText:[statemachine push:1]];
}

////////////////  2  //////////////
- (IBAction)push2:(id)sender{
    [self push:2];
    [[self label] setText:[statemachine push:2]];
}

/////////////////  3  /////////////
- (IBAction)push3:(id)sender{
    [self push:3];
    [[self label] setText:[statemachine push:3]];
}

////////////////  0  //////////////
- (IBAction)push0:(id)sender{
    [self push:0];
    [[self label] setText:[statemachine push:0]];
}





@end
