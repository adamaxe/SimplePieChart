/**
Graph UIView.  Implementation.

Take data and draw a pie chart.
 
@author Team Axe, LLC. http://www.teamaxe.org, Submitted to Public Domain
@class GraphView GraphView.h
@date 09/05/2010
@file
*/

#import "GraphView.h"

@implementation GraphView

@synthesize pieValues, pieColors;

const float kDefaultPieDegrees = 360;

#pragma mark -
#pragma mark View lifecycle

/**
Initialization.
@param CGRect frame in which to draw
@retval self
*/
- (id)initWithFrame:(CGRect)frame {

    if ((self = [super initWithFrame:frame])) {

		//Ensure that background color is transparent
		self.backgroundColor = [UIColor clearColor];

        //Ensure that Pie has some default values in case of forgotten setter
        pieValues = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:kDefaultPieDegrees], nil];
        pieColors = [[NSArray alloc] initWithObjects:[UIColor redColor], nil];
            
	}

    return self;
}

- (void)drawRect:(CGRect)rect {
	    
	//Get the bounds of the screen to determine width/height of pie
	CGRect parentViewBounds = self.bounds;
   	
	//Generate width/height of pie
	//You should probably make all of the following numbers into constants
	CGFloat height =  CGRectGetHeight(parentViewBounds)*0.65;
    CGFloat width =  CGRectGetWidth(parentViewBounds)*0.65;    

	//Generate center point of pie
	CGFloat x = CGRectGetWidth(parentViewBounds)/2.1;
	CGFloat y = CGRectGetHeight(parentViewBounds)/2.1;
	
	//Create graphics context and clear
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, rect);
	
	//Create an outer circle upon which the actual pie chart sits
	//Do this to create a distinction between the chart and the UIView
	//Define line width of outer circle
	CGContextSetLineWidth(context, 2);

	//Define stroke color of outer circle, light gray
	CGContextSetRGBStrokeColor(context, 0.5,0.5,0.5,1);

	//Define fill color of outer circle, lighter gray
	CGContextSetRGBFillColor (context, 0.9, 0.9, 0.9, 1);
	
	//Fill and Stroke the outer circle
	//This is the end of the outer circle drawing
	CGContextFillEllipseInRect(context, CGRectMake(x/3, y/3, width, height));
	CGContextStrokeEllipseInRect(context, CGRectMake(x/3, y/3, width, height));
    
	//From here on, each actual pie slice is going to be drawn
	//Create a dropshadow on each pie slice in order to show distinction
	CGSize shadowOffset = CGSizeMake (5, 5);	
	CGContextSetShadow(context, shadowOffset, 5);
        
	//Ensure pieValues got propogated
	if ([pieValues count] > 0) {

		//We'll be drawing each slice of the pie by hand with Core Graphics
		//The operation will be:
		//a. Set center point for drawing instructions
		//b. Draw an Arc between the starting point and ending point at a radius
		//c. Close/Fill/Stroke/Shadow the path
		//d. Set next start point of slice to ending point of previous slice

		float arcPoint = 0;
		float arcPointNext = 0;
		float arcPointRadians = 0;
		float arcPointNextRadians = 0;

		//Iterate through the values
		//Array contains the number of degrees the value takes in the pie
		//You must add these to each subsequent slice, 
		//Otherwise, slice will be continually drawn over itself
        for (int i = 0; i < [pieValues count]; i++) {

			//Array is composed of NSNumbers that must be casted back down to floats
			arcPointNext += [[pieValues objectAtIndex:i] floatValue];
			CGContextMoveToPoint(context, x, y);
            
			//Core Graphics Arc functions take radians as arguments
			//Math class, radians = [(degrees * Pi)/180]
			arcPointRadians = (arcPoint * M_PI)/180.0;
			arcPointNextRadians = (arcPointNext * M_PI)/180.0;

			//Get drawing context, set radius = width/2.5, set starting and ending points
			CGContextAddArc(context, x, y, width/2.5, arcPointRadians, arcPointNextRadians, 0);

			//Fill slice with appropriate color
			CGContextSetFillColor(context, CGColorGetComponents([[pieColors objectAtIndex:i] CGColor]));	            
            CGContextClosePath(context);
			CGContextFillPath(context);
			CGContextStrokePath(context);

			//Set next start point as previous endpoint
			arcPoint = arcPointNext;
		}
	}
}

#pragma mark -
#pragma mark Memory management

/**
Release init'ed objects, deallocate super.
*/
- (void)dealloc {

	//Clean up synthesized properties
	[pieValues release];
	[pieColors release];

	[super dealloc];
    
}

@end