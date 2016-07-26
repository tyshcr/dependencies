//
//  dependenciesTests.m
//  dependenciesTests
//
//  Created by Christopher Tysh on 7/26/16.
//  Copyright © 2016 Christopher Tysh. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Dependencies.h"

@interface dependenciesTests : XCTestCase

@end

@implementation dependenciesTests

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

- (void)testDependencies {
    Dependencies *dep = [[Dependencies alloc] init];
    
    [dep addDirect:@"A" withDependencies:@[@"B",@"C"]];
    [dep addDirect:@"B" withDependencies:@[@"C",@"E"]];
    [dep addDirect:@"C" withDependencies:@[@"G"]];
    [dep addDirect:@"D" withDependencies:@[@"A",@"F"]];
    [dep addDirect:@"E" withDependencies:@[@"F"]];
    [dep addDirect:@"F" withDependencies:@[@"H"]];
    
    NSArray *test1 = @[@"B",@"C",@"E",@"F",@"G",@"H"];
    NSArray *test2 = @[@"C",@"E",@"F",@"G",@"H"];
    NSArray *test3 = @[@"G"];
    NSArray *test4 = @[@"A",@"B",@"C",@"E",@"F",@"G",@"H"];
    NSArray *test5 = @[@"F",@"H"];
    NSArray *test6 = @[@"H"];
    
    XCTAssertTrue([[dep dependenciesFor:@"A"] isEqualToArray:test1]);
    XCTAssertTrue([[dep dependenciesFor:@"B"] isEqualToArray:test2]);
    XCTAssertTrue([[dep dependenciesFor:@"C"] isEqualToArray:test3]);
    XCTAssertTrue([[dep dependenciesFor:@"D"] isEqualToArray:test4]);
    XCTAssertTrue([[dep dependenciesFor:@"E"] isEqualToArray:test5]);
    XCTAssertTrue([[dep dependenciesFor:@"F"] isEqualToArray:test6]);
}

- (void)testCircularity {
    Dependencies *dep = [[Dependencies alloc] init];
    
    [dep addDirect:@"A" withDependencies:@[@"B"]];
    [dep addDirect:@"B" withDependencies:@[@"C",@"D"]];
    [dep addDirect:@"C" withDependencies:@[@"A"]];
    [dep addDirect:@"D" withDependencies:@[@"E"]];
    [dep addDirect:@"E" withDependencies:@[@"B",@"F"]];
    [dep addDirect:@"F" withDependencies:@[@"G"]];
    
    NSArray *test1 = @[@"B",@"C",@"D",@"E",@"F",@"G"];
    
    XCTAssertTrue([[dep dependenciesFor:@"A"] isEqualToArray:test1]);
}


@end
