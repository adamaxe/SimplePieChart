/**
 PieChart AppDelegate.  This class represents beginning of code.
 
 This is a simple Pie Chart generation project.  This Xcode Project contains all the documentation, Classes and Unit Tests for a fully functioning Pie Chart.
 
 <br>The actual Class that you'll want to use is the GraphView and the corresponding UnitTests.  The rest of these Classes are just utilized in order to demonstrate how to generate the GraphView.
 <br>
 <br>Documentation is generated by Doxygen.  A Doxygen configuration file is included as well.
 <br>This code is released into the Public Domain.
 
 @mainpage PieChart
 @version 1.0
 @author Team Axe, LLC. http://www.teamaxe.org
 @class PieChartAppDelegate
 @date 03/28/2011
 @file
 */

#import <UIKit/UIKit.h>

@class PieChartViewController;

@interface PieChartAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PieChartViewController *viewController;

@end
