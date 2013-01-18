//
//  CalculatorViewController.m
//  Calculator
//
//  Created by 佐々木　恵理子 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import "CalculatorViewController.h"


@interface CalculatorViewController () {
    char moji;
    double output;
    double suboutput;
    int Minus; //　マイナス表示
    int Dot; //  小数点の有無
    int dotcount;
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
    moji=' ';
    output=0;
    suboutput=0;
    Minus=0; //　マイナス表示
    Dot=0; //  小数点の有無
    dotcount=0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////////////////  AC  /////////////////
- (IBAction)pushac:(id)sender {
    [statemachine pushac];
    output=0;
    suboutput=0;
    state=nothing;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
    [[self label] setText:[NSString stringWithFormat:@"%g",output]];
    [[self labelc] setText:@""];
}

////////////////  +-  /////////////////
- (IBAction)pushplumai:(id)sender {
    Minus=1;
    moji='-';
    [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,[statemachine output]]];
}

////////////  calculate関数  ///////////
//-(void)calculate:(int)mark{
//    if(M==1){
//        n=-n;
//    }
//    if(state==nothing){
//        m=n;
//    }
//    else{
//        [self switches:state];
//    }
//    state=mark;
//    n=0;
//    D=0;
//    d=0;
//    M=0;
//    moji=' ';
//    [[self label] setText:[NSString stringWithFormat:@"%g",n]];
//}

/////////////  switches  /////////////
//-(void)switches:(int)C{
//    switch(C){
//        case add:
//            m=m+n;
//            break;
//        case sub:
//            m=m-n;
//            break;
//        case asta:
//            m=m*n;
//            break;
//        case slash:
//            m=m/n;
//            break;
//    }
//}

/////////////////  -  ////////////////
- (IBAction)pushminus:(id)sender {
    [[self label] setText:[statemachine calculate:sub]];
    [[self labelc] setText:[NSString stringWithFormat:@"%g -",[statemachine suboutput]]];
}

////////////////  *  /////////////////
- (IBAction)pushasta:(id)sender {
    [[self label] setText:[statemachine calculate:asta]];
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
//    if(M==1){
//        n=-n;
//    }

//    [statemachine switches:state];
//    NSLog(@"ACpush:%f",m);
    
//    n=m;
    [[self label] setText:[statemachine pushequal]];
    suboutput=0;
    [[self labelc] setText:@""];
    state=nothing;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
}

////////////////  .  ////////////////
- (IBAction)pushperiod:(id)sender{
    Dot=1;
        [[self label] setText:[NSString stringWithFormat:@"%c%g.",moji,[statemachine output]]];
}

/////////////  dot関数  /////////////
//-(void)dot:(int)number{
//    if (number==0) {
//        switch (d) {
//            case 1:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.1f",moji,n]];
//                break;
//            case 2:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.2f",moji,n]];
//                break;
//            case 3:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.3f",moji,n]];
//                break;
//            case 4:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.4f",moji,n]];
//                break;
//            case 5:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.5f",moji,n]];
//                break;
//            case 6:
//                [[self label] setText:[NSString stringWithFormat:@"%c%.6f",moji,n]];
//                break;
//        }
//    }
//    else{
//        [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
//    }
//}

//////////////  push関数  ////////////
//- (void)push:(int) number
//{
//    if(D==1){
//        d=d+1;
//        n=n+number*pow(0.1,d);
//        [self dot:number];
//        return;
//    }
//    else{
//            n=n*10+number;
//            [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
//    }
//}

////////////////  7  //////////////
- (IBAction)push7:(id)sender{
    [[self label] setText:[statemachine push:7 withD:Dot]];
    
}

////////////////  8  //////////////
- (IBAction)push8:(id)sender{
    [[self label] setText:[statemachine push:8 withD:Dot]];
}

////////////////  9  /////////////
- (IBAction)push9:(id)sender{
    [[self label] setText:[statemachine push:9 withD:Dot]];
}

////////////////  4  //////////////
- (IBAction)push4:(id)sender{
    [[self label] setText:[statemachine push:4 withD:Dot]];
}

/////////////////  5  /////////////
- (IBAction)push5:(id)sender{
    [[self label] setText:[statemachine push:5 withD:Dot]];
}

////////////////  6  //////////////
- (IBAction)push6:(id)sender{
    [[self label] setText:[statemachine push:6 withD:Dot]];
}

////////////////  1  //////////////
- (IBAction)push1:(id)sender{
    [[self label] setText:[statemachine push:1 withD:Dot]];
}

////////////////  2  //////////////
- (IBAction)push2:(id)sender{
    [[self label] setText:[statemachine push:2 withD:Dot]];
}

/////////////////  3  /////////////
- (IBAction)push3:(id)sender{
    [[self label] setText:[statemachine push:3 withD:Dot]];
}

////////////////  0  //////////////
- (IBAction)push0:(id)sender{
    [[self label] setText:[statemachine push:0 withD:Dot]];
}





@end
