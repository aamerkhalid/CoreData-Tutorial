//
//  CoursesTableViewController.h
//  CDCourses
//
//  Created by Salman Khalid on 24/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AddCourseViewController.h"

@interface CoursesTableViewController : UITableViewController<AddCourseViewControllerDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic)NSManagedObjectContext * managedObjectContext;

@property (strong, nonatomic)NSFetchedResultsController * fetchedResultsController;

@end
