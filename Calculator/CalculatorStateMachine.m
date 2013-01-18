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

@synthesize output;
@synthesize suboutput;
@synthesize state;

char moji=' ';
double output=0;
double suboutput=0;
int Minus=0; //　マイナス表示
int Dot=0; //  小数点の有無
int dotcount=0;

////////////////  AC  /////////////////
- (void)pushac{
    output=0;
    suboutput=0;
    state=nothing;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
}

/////////////////  =  ///////////////
- (NSString *)pushequal{
    if(Minus==1){
        output=-output;
    }
    
    [self switches:state];
    
    output=suboutput;
    NSLog(@"=output:%g",output);
    NSLog(@"=suboutput:%f",suboutput);
    return [NSString stringWithFormat:@"%g",output];
}

/////////////  dot関数  /////////////
-(NSString *)dot:(int)number{
    if (number==0) {
        switch (dotcount) {
            case 1:
                return [NSString stringWithFormat:@"%c%.1f",moji,output];
                break;
            case 2:
                return [NSString stringWithFormat:@"%c%.2f",moji,output];
                break;
            case 3:
                return [NSString stringWithFormat:@"%c%.3f",moji,output];
                break;
            case 4:
                return [NSString stringWithFormat:@"%c%.4f",moji,output];
                break;
            case 5:
                return [NSString stringWithFormat:@"%c%.5f",moji,output];
                break;
            case 6:
                return [NSString stringWithFormat:@"%c%.6f",moji,output];
                break;
        }
    }
    return [NSString stringWithFormat:@"%c%g",moji,output];
}

//////////////  push関数  ////////////
- (NSString *)push:(int)number withD:(int)D
{
    if(D==1){
        dotcount=dotcount+1;
        output=output+number*pow(0.1,dotcount);
        return [self dot:number];
    
    }
    else{
        output=output*10+number;
        NSLog(@"pushoutput:%f",output);
        NSLog(@"pushsuboutput:%f",suboutput);
        return [NSString stringWithFormat:@"%c%g",moji,output];
    }
}

////////////  calculate関数  ///////////
-(NSString *)calculate:(int)mark{
    if(Minus==1){
        output=-output;
    }
    if(state==nothing){
        suboutput=output;
    }
    else{
        NSLog(@"calculateoutput:%f",output);
        NSLog(@"calculatesuboutput:%f",suboutput);

        [self switches:state];
        NSLog(@"calculatestate:%d",state);
    }
    state=mark;
    output=0;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
    NSLog(@"calculateoutput:%f",output);
    NSLog(@"calculatesuboutput:%f",suboutput);
    return [NSString stringWithFormat:@"%g",output];
}

/////////////  switches  /////////////
-(void)switches:(int)C{
    switch(C){
        case add:
            suboutput=suboutput+output;
            break;
        case sub:
            suboutput=suboutput-output;
            break;
        case asta:
            suboutput=suboutput*output;
            break;
        case slash:
            suboutput=suboutput/output;
            break;
    }
}


@end
