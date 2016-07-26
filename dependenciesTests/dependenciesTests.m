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

- (void)testMasterDictionary {
    Dependencies *dep = [[Dependencies alloc] init];
    
    NSArray *array1 = @[@"B",@"C",@"D"];
    NSArray *array2 = @[@"E",@"F",@"G"];
    
    [dep addDirect:@"A" withArray:@[@"F",@"C",@"D"]];
    [dep addDirect:@"B" withArray:@[@"E",@"F",@"G"]];
    [dep addDirect:@"F" withArray:@[@"H",@"J",@"K"]];
    
    NSLog(@"FOUND %@", [dep dependenciesFor:@"A");
    
    XCTAssertTrue([[dep dependenciesFor:@"A"] isEqualToArray:array1]);
    //XCTAssertTrue([[dep dependenciesFor:@"B"] isEqualToArray:array2]);
    
}


@end
