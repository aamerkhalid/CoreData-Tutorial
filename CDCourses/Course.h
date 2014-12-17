//
//  Course.h
//  CDCourses
//
//  Created by Salman Khalid on 24/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * title;

@end
