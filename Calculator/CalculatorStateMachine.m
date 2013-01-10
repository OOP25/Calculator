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

char moji=' ';
double n=0;
int D=0; //  小数点の有無
int d=0;

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
    else{
        return [NSString stringWithFormat:@"%c%g",moji,n];
    }
}
//////////////  push関数  ////////////
- (NSString *)push:(int) number
{
    if(D==1){
        d=d+1;
        n=n+number*pow(0.1,d);
        return [self dot:number];
    
    }
    else{
        n=n*10+number;
//        [[self label] setText:[NSString stringWithFormat:@"%c%g",moji,n]];
        return [NSString stringWithFormat:@"%c%g",moji,n];
    }
}

@end
