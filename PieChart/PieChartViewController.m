/**
 PieChartViewController.m Controller which will house the pie chart
 
 @author Team Axe, LLC. http://www.teamaxe.org, Submitted to Public Domain
 @class PieChartViewController PieChartViewController.h
 @date 03/30/2011
 @file
 */

#import "PieChartViewController.h"

@implementation PieChartViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableString *pieChartLabelString = [[NSMutableString alloc] init];
    
    //Create Graph View
    GraphView *graph = [[GraphView alloc] initWithFrame:CGRectMake(35.0, 0.0, 240, 240)];
    
    //Dummy Data
    NSArray *generatedPieValues = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:24.5], [NSNumber numberWithFloat:12.0], [NSNumber numberWithFloat:241.2], [NSNumber numberWithFloat:82.3], nil];
    NSArray *generatedPieColors = [[NSArray alloc] initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor], nil];
    
    //Assign Dummy Data to Graph
    [graph setPieValues:generatedPieValues];
    [graph setPieColors:generatedPieColors];
    
    //Add graph to view
    [self.view addSubview:graph];
    
    //Graph is owned by view now, get rid of it
    [graph release];
    
    //Display pieChart values
    for (NSNumber *pieValue in generatedPieValues) {
        
        [pieChartLabelString appendFormat:@"%.2f, ", [pieValue floatValue]];
    }
    
    [pieChartLabel setText:pieChartLabelString];
    
    //Arrays are owned by graph now, get rid of them
    [generatedPieValues release];
    [generatedPieColors release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
