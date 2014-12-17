//
//  AddCourseViewController.m
//  CDCourses
//
//  Created by Salman Khalid on 28/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import "AddCourseViewController.h"

@interface AddCourseViewController ()

@end

@implementation AddCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _titleField.text = [self.currentCourse title];
    _authorField.text = [self.currentCourse author];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    _dateField.text = [dateFormatter stringFromDate:[self.currentCourse releaseDate]];
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

- (IBAction)cancel:(UIBarButtonItem *)sender {
    //dismiss and remove the object
 
    [self.delegate addCourseViewControllerDidCancel:[self currentCourse]];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(UIBarButtonItem *)sender {
    //dismiss and save the context
    
    [self.currentCourse setTitle:_titleField.text];
    [self.currentCourse setAuthor:_authorField.text];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    [self.currentCourse setReleaseDate:[dateFormatter dateFromString:_dateField.text]];
    
    [self.delegate addCourseViewControllerDidSave];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
@end
