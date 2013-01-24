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
@synthesize moji;
@synthesize Minus;
@synthesize Dot;
@synthesize dotcount;




- (id)init {
    self = [super init];
    if(self != nil) {
        output = 0;
        suboutput = 0;
        state = nothing;
        Minus = 0;
        Dot = 0;
        dotcount = 0;
        moji = ' ';
    }
    return self;
}


////////////////  pushac関数  /////////////////
- (void)pushac{
    output=0;
    suboutput=0;
    state=nothing;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
}

/////////////////  pushepual関数  ///////////////
- (NSString *)pushequal{
    if(Minus==1){
        output=-output;
    }
    
    [self switches:state];
    
    output=suboutput;
    suboutput=0;
    state=nothing;
    moji=' ';
    Minus=0;
    return [NSString stringWithFormat:@"%g",output];
}

////////////////  pushplumi関数  /////////////////
- (void)pushplumai{
    Minus=1;
    moji='-';
}

////////////////  pushperiod関数  ////////////////
- (void)pushperiod{
    Dot=1;
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
- (NSString *)push:(int)number
{
    if(Dot==1){
        dotcount=dotcount+1;
        output=output+number*pow(0.1,dotcount);
        return [self dot:number];
    
    }
    else{
        output=output*10+number;
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
        [self switches:state];
    }
    state=mark;
    output=0;
    Dot=0;
    dotcount=0;
    Minus=0;
    moji=' ';
    
    return [NSString stringWithFormat:@"%g",output];
}

/////////////  switches関数  /////////////
-(void)switches:(int)operationState{
    switch(operationState){
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
