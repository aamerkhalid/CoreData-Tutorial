//
//  DisplayEditViewController.h
//  CDCourses
//
//  Created by Salman Khalid on 04/12/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
@interface DisplayEditViewController : UIViewController

@property (strong, nonatomic)Course *currnetCourse;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (weak, nonatomic) IBOutlet UIButton *editButton;
- (IBAction)editButtonTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;
- (IBAction)doneButtonTapped:(id)sender;

@end
