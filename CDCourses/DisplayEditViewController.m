//
//  DisplayEditViewController.m
//  CDCourses
//
//  Created by Salman Khalid on 04/12/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import "DisplayEditViewController.h"
#import "AppDelegate.h"

@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleField.text = self.currnetCourse.title;
    self.authorField.text = self.currnetCourse.author;
    
    NSDateFormatter *dateFormate = [[NSDateFormatter alloc]init];
    [dateFormate setDateFormat:@"yyyy-MM-dd"];
    self.dateField.text = [dateFormate stringFromDate:self.currnetCourse.releaseDate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editButtonTapped:(id)sender {
    //start editing
    
    self.titleField.enabled = YES;
    self.authorField.enabled = YES;
    self.dateField.enabled = YES;
    
    self.titleField.borderStyle = UITextBorderStyleRoundedRect;
    self.authorField.borderStyle = UITextBorderStyleRoundedRect;
    self.dateField.borderStyle = UITextBorderStyleRoundedRect;
    
    _editButton.hidden = YES;
    _doneButton.hidden = NO;
}

- (IBAction)doneButtonTapped:(id)sender {
    //end editting
    
    self.titleField.enabled = NO;
    self.authorField.enabled = NO;
    self.dateField.enabled = NO;
    
    self.titleField.borderStyle = UITextBorderStyleNone;
    self.authorField.borderStyle = UITextBorderStyleNone;
    self.dateField.borderStyle = UITextBorderStyleNone;
    
    _editButton.hidden = NO;
    _doneButton.hidden = YES;
    
    self.currnetCourse.title = _titleField.text;
    self.currnetCourse.author = _authorField.text;
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    self.currnetCourse.releaseDate = [dateformatter dateFromString:_authorField.text];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate saveContext];
    
}
@end
