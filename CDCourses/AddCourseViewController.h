//
//  AddCourseViewController.h
//  CDCourses
//
//  Created by Salman Khalid on 28/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol AddCourseViewControllerDelegate;

@interface AddCourseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (nonatomic, strong) Course *currentCourse;

@property (nonatomic, weak)id <AddCourseViewControllerDelegate>delegate;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)save:(UIBarButtonItem *)sender;

@end


@protocol AddCourseViewControllerDelegate

-(void)addCourseViewControllerDidSave;
-(void)addCourseViewControllerDidCancel:(Course *)courseToDelete;

@end
