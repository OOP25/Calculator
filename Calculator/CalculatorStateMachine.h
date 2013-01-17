//
//  CalculatorStateMachine.h
//  Calculator
//
//  Created by 佐々木　恵理子 on 13/01/10.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorStateMachine : NSObject
@property double n;
@property double m;
@property enum {nothing,sub,asta,slash,add} state;

-(void)pushac;
-(NSString *)pushequal;
-(NSString *)dot:(int) number;
-(NSString *)push:(int) number withD:(int)D;
-(NSString *)calculate:(int)mark;
-(void)switches:(int)C;

@end
