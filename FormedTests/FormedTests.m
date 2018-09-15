//
//  FormedTests.m
//  FormedTests
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Form.h"

@interface FormedTests : XCTestCase

@end

@implementation FormedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testAddSection {
    Form *form = [[Form alloc] init];
    [form addSection:@"New Section"];
    XCTAssertEqualObjects(form.sections[0].sectionName, @"New Section");
}

-(void)testAddTextField {
    
}

-(void)testAddStepper {
    
}

-(void)testAddSwitch {
    // Check if adding works in on and off mode.
    Form *form = [[Form alloc] init];
    [form addSection:@"New Section"];
    [form addSwitch:@"Switch"];
    XCTAssertEqualObjects(form.sections[0].inputs[0].inputName, @"Switch");
}

-(void)testGetValue {
    Form *form = [[Form alloc] init];
    [form addSection:@"New Section"];
    [form addStepper:@"Stepper"];
    NSString *value = [form getValue:@"Stepper"];
    XCTAssertEqualObjects(value, @"0");
}

@end
