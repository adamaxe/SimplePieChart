/**
 PieChartViewController.h  Controller which will generate the View that will house the pie chart.
 
 @author Team Axe, LLC. http://www.teamaxe.org, Submitted to Public Domain
 @class PieChartViewController
 @date 03/30/2011
 @file
 */

#import <UIKit/UIKit.h>
#import "GraphView.h"

@interface PieChartViewController : UIViewController {
    
    IBOutlet UILabel *pieChartLabel;    /**< Label to display values of slices */
    
}

@end
