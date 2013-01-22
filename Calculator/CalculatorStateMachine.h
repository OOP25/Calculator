//
//  CalculatorStateMachine.h
//  Calculator
//
//  Created by 佐々木　恵理子 on 13/01/10.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorStateMachine : NSObject
@property double output;
@property double suboutput;
@property enum {nothing,sub,asta,slash,add} state;

-(void)pushac;
-(NSString *)pushequal;
-(void)pushperiod;
-(NSString *)dot:(int) number;
-(NSString *)push:(int) number;
-(NSString *)calculate:(int)mark;
-(void)switches:(int)C;

@end
