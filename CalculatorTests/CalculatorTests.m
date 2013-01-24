//
//  CalculatorTests.m
//  CalculatorTests
//
//  Created by 佐々木　恵理子 on 12/10/16.
//  Copyright (c) 2012年 admin. All rights reserved.
//

#import "CalculatorTests.h"
#import "CalculatorStateMachine.h"

@implementation CalculatorTests

@synthesize statemachine;

- (void)setUp
{
    [super setUp];
    statemachine = [[CalculatorStateMachine alloc]init];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//switches関数で四則演算ができているかどうかテスト
-(void)testSwitches
{
    //足し算add  6+2=8
    statemachine.suboutput=6;
    statemachine.output=2;
    [statemachine switches:add];
    STAssertEqualsWithAccuracy(8.0, statemachine.suboutput, 0.00001, @"swiches:add error");

    //引き算sub  6-2=4
    statemachine.suboutput=6;
    statemachine.output=2;
    [statemachine switches:sub];
    STAssertEqualsWithAccuracy(4.0, statemachine.suboutput, 0.00001, @"swiches:sub error");

    //かけ算asta  6*2=12
    statemachine.suboutput=6;
    statemachine.output=2;
    [statemachine switches:asta];
    STAssertEqualsWithAccuracy(12.0, statemachine.suboutput, 0.00001, @"swiches:asta error");
    
    //割り算slash  6/2=3
    statemachine.suboutput=6;
    statemachine.output=2;
    [statemachine switches:slash];
    STAssertEqualsWithAccuracy(3.0, statemachine.suboutput, 0.00001, @"swiches:slash error");
}

//
-(void)testCalculate
{
    //Minus!=1 , state!=nothing
    //5-1= 4
    statemachine.Minus=0;
    statemachine.state=sub;
    statemachine.output=1;
    statemachine.suboutput=5;
    [statemachine calculate:sub];
    STAssertEqualsWithAccuracy(4.0, statemachine.suboutput, 0.00001, @"calculate:suboutput error");
    STAssertEqualsWithAccuracy(0.0, statemachine.output, 0.00001, @"calculate:output error");
    
    //Minus!=1 , state=nothing
    //何も計算していないとき、5を押す
    statemachine.Minus=0;
    statemachine.state=nothing;
    statemachine.output=5;
    statemachine.suboutput=0;
    [statemachine calculate:nothing];
    STAssertEqualsWithAccuracy(5.0, statemachine.suboutput, 0.00001, @"calculate:suboutput error");
    STAssertEqualsWithAccuracy(0.0, statemachine.output, 0.00001, @"calculate:output error");
    
    //Minus=1 , state!=nothing
    //2*(-5)= -10
    statemachine.Minus=1;
    statemachine.state=asta;
    statemachine.output=5;
    statemachine.suboutput=2;
    [statemachine calculate:asta];
    STAssertEqualsWithAccuracy(-10.0, statemachine.suboutput, 0.00001, @"calculate:suboutput error");
    STAssertEqualsWithAccuracy(0.0, statemachine.output, 0.00001, @"calculate:output error");
    
    //Minus=1 , state=nothing
    //何も計算していないとき、-5を押す
    statemachine.Minus=1;
    statemachine.state=nothing;
    statemachine.output=3;
    statemachine.suboutput=0;
    [statemachine calculate:nothing];
    STAssertEqualsWithAccuracy(-3.0, statemachine.suboutput, 0.00001, @"calculate:suboutput error");
    STAssertEqualsWithAccuracy(0.0, statemachine.output, 0.00001, @"calculate:output error");
}



//pushequal関数でMinusによる条件分岐ができているかどうかテスト
-(void)testEqual
{
    //Minus!=1のとき
    //1+9= 10
    statemachine.suboutput=1;
    statemachine.output=9;
    statemachine.Minus=0;
    statemachine.state=add;
    [statemachine pushequal];
    STAssertEqualsWithAccuracy(0.0, statemachine.suboutput, 0.00001, @"equal:suboutput error");
    STAssertEqualsWithAccuracy(10.0, statemachine.output, 0.00001, @"equal:output error");
    
    //Minus=1のとき
    //1-9= -8
    statemachine.suboutput=1;
    statemachine.output=9;
    statemachine.Minus=1;
    statemachine.state=add;
    [statemachine pushequal];
    STAssertEqualsWithAccuracy(0.0, statemachine.suboutput, 0.00001, @"equal:suboutput error");
    STAssertEqualsWithAccuracy(-8.0, statemachine.output, 0.00001, @"equal:output error");
    STAssertEqualsWithAccuracy(0, statemachine.Minus, 0.00001, @"equal:Minus error");
}

//push関数でDotによる条件分岐ができているかどうかテスト
-(void)testPush
{
    //Dot!=1のとき
    //2*10+1= 21
    statemachine.Dot=0;
    statemachine.output=2;
    [statemachine push:1];
    STAssertEqualsWithAccuracy(21.0, statemachine.output, 0.00001, @"push:output error");
    
    //Dot=1のとき
    //2+(1*0.1^2)= 2.01
    statemachine.Dot=1;
    statemachine.dotcount=1;
    statemachine.output=2;
    [statemachine push:1];
    STAssertEqualsWithAccuracy(2.01, statemachine.output, 0.00001, @"push:output error");
}




@end
