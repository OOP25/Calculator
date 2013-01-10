//
//  CalculatorStateMachine.h
//  Calculator
//
//  Created by 佐々木　恵理子 on 13/01/10.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorStateMachine : NSObject

-(NSString *)dot:(int) number;
-(NSString *)push:(int) number;

@end
