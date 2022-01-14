//
//  IMPDecisionContextTest.m
//  ImproveUnitTests
//
//  Created by PanHongxi on 1/14/22.
//  Copyright © 2022 Mind Blown Apps, LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IMPDecisionModel.h"
#import "IMPDecisionContext.h"

@interface IMPDecision ()

@property(nonatomic, readonly, nullable) id best;

@property(nonatomic, strong) NSArray *scores;

@property(nonatomic, strong) NSDictionary *givens;

@property (nonatomic, readonly) int tracked;

@end

@interface IMPDecisionContextTest : XCTestCase

@end

@implementation IMPDecisionContextTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (NSArray *)variants {
    return @[@"Hello World", @"Howdy World", @"Hi World"];
}

- (void)testChooseFrom {
    IMPDecisionModel *decisionModel = [[IMPDecisionModel alloc] initWithModelName:@"hello"];
    IMPDecisionContext *decisionContext = [[IMPDecisionContext alloc] initWithModel:decisionModel andGivens:nil];
    IMPDecision *decision = [decisionContext chooseFrom:[self variants]];
    XCTAssertNotNil(decision.best);
    XCTAssertNotNil(decision.givens);
    XCTAssertNotNil(decision.scores);
}

- (void)testChooseFrom_nil_variants {
    NSArray *variants = nil;
    IMPDecisionModel *decisionModel = [[IMPDecisionModel alloc] initWithModelName:@"hello"];
    IMPDecisionContext *decisionContext = [[IMPDecisionContext alloc] initWithModel:decisionModel andGivens:nil];
    @try {
        [decisionContext chooseFrom:variants];
    } @catch(NSException *e) {
        XCTAssertEqual(NSInvalidArgumentException, e.name);
        return ;
    }
    XCTFail(@"An exception should have been thrown.");
}

- (void)testChooseFrom_empty_variants {
    NSArray *variants = @[];
    IMPDecisionModel *decisionModel = [[IMPDecisionModel alloc] initWithModelName:@"hello"];
    IMPDecisionContext *decisionContext = [[IMPDecisionContext alloc] initWithModel:decisionModel andGivens:nil];
    @try {
        [decisionContext chooseFrom:variants];
    } @catch(NSException *e) {
        XCTAssertEqual(NSInvalidArgumentException, e.name);
        return ;
    }
    XCTFail(@"An exception should have been thrown.");
}


@end
