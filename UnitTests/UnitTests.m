/**
PieChartTests.m Unit Tests for Graph

@author Team Axe, LLC. http://www.teamaxe.org, Submitted to Public Domain
@class UnitTests UnitTests.h
@date 03/30/2011
@file
 */

#import "UnitTests.h"
#import "GraphView.h"

const int kGraphHeight = 240;
const int kGraphWidth = 240;

@implementation UnitTests

- (void)setUp
{
    [super setUp];
    testingGraphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0,  kGraphWidth, kGraphHeight)];
}

- (void)tearDown
{
    
    [super tearDown];
    [testingGraphView release];

}

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application

- (void)testAppDelegate {
    
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
    
}

#else                           // all code under test must be linked into the Unit Test bundle

- (void)testGraphExists{
    
    STAssertNotNil(testingGraphView, @"The graph was not init'ed.");
}

- (void)testDefaultData{
    
    STAssertEqualObjects([NSNumber numberWithFloat:360.0], [[testingGraphView pieValues] objectAtIndex:0], @"Default Graph data inaccurate.");
    STAssertEqualObjects([UIColor redColor], [[testingGraphView pieColors] objectAtIndex:0], @"Default Graph Color inaccurate.");
}

- (void)testGraphProperties{

    NSNumber *pieValue1 = [[NSNumber alloc] initWithFloat:30.0];
    NSNumber *pieValue2 = [[NSNumber alloc] initWithFloat:70.0];

	NSArray *testValues = [[NSArray alloc] initWithObjects:pieValue1, pieValue2, nil];
	NSArray *testColors = [[NSArray alloc] initWithObjects:[UIColor blueColor], [UIColor greenColor], nil];
    
    [testingGraphView setPieValues:testValues];
    [testingGraphView setPieColors:testColors];
    
    STAssertEqualObjects(pieValue1, [[testingGraphView pieValues] objectAtIndex:0], @"Graph data setter inaccurate.");
    STAssertEqualObjects([UIColor blueColor], [[testingGraphView pieColors] objectAtIndex:0], @"Graph color setter inaccurate.");

	[pieValue1 release];
	[pieValue2 release];
	[testValues release];
	[testColors release];

}

#endif

@end
