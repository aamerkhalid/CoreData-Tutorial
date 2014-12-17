//
//  Course.m
//  CDCourses
//
//  Created by Salman Khalid on 24/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import "Course.h"


@implementation Course

@dynamic releaseDate;
@dynamic author;
@dynamic title;

-(void)awakeFromInsert
{
    [super awakeFromInsert];
    self.releaseDate = [NSDate date];
}

@end
