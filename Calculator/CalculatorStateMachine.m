//
//  CalculatorStateMachine.m
//  Calculator
//
//  Created by 佐々木　恵理子 on 13/01/10.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "CalculatorStateMachine.h"
#import "CalculatorViewController.h"

@implementation CalculatorStateMachine

@synthesize n;
@synthesize m;
@synthesize state;

char moji=' ';
double n=0;
double m=0;
int M=0; //　マイナス表示
int D=0; //  小数点の有無
int d=0;

////////////////  AC  /////////////////
- (void)pushac{
    n=0;
    m=0;
    state=nothing;
    D=0;
    d=0;
    M=0;
    moji=' ';
}

/////////////////  =  ///////////////
- (NSString *)pushequal{
    if(M==1){
        n=-n;
    }
    
    [self switches:state];
    NSLog(@"ACpush:%f",m);
    
    n=m;
    return [NSString stringWithFormat:@"%g",n];
}

/////////////  dot関数  /////////////
-(NSString *)dot:(int)number{
    if (number==0) {
        switch (d) {
            case 1:
                return [NSString stringWithFormat:@"%c%.1f",moji,n];
                break;
            case 2:
                return [NSString stringWithFormat:@"%c%.2f",moji,n];
                break;
            case 3:
                return [NSString stringWithFormat:@"%c%.3f",moji,n];
                break;
            case 4:
                return [NSString stringWithFormat:@"%c%.4f",moji,n];
                break;
            case 5:
                return [NSString stringWithFormat:@"%c%.5f",moji,n];
                break;
            case 6:
                return [NSString stringWithFormat:@"%c%.6f",moji,n];
                break;
        }
    }
    return [NSString stringWithFormat:@"%c%g",moji,n];
}

//////////////  push関数  ////////////
- (NSString *)push:(int)number withD:(int)D
{
    if(D==1){
        d=d+1;
        n=n+number*pow(0.1,d);
        return [self dot:number];
    
    }
    else{
        n=n*10+number;
        return [NSString stringWithFormat:@"%c%g",moji,n];
    }
}

////////////  calculate関数  ///////////
-(NSString *)calculate:(int)mark{
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
    return [NSString stringWithFormat:@"%g",n];
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


@end
