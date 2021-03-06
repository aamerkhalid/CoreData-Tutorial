//
//  CoursesTableViewController.m
//  CDCourses
//
//  Created by Salman Khalid on 24/11/2014.
//  Copyright (c) 2014 Salman Khalid. All rights reserved.
//

#import "CoursesTableViewController.h"
#import "Course.h"
#import "DisplayEditViewController.h"


@interface CoursesTableViewController ()

@end

@implementation CoursesTableViewController

@synthesize fetchedResultsController = _fetchedResultsController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSError *error=nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Error ! %@",error);
        abort();
    }
    
}

-(void)addCourseViewControllerDidSave
{
    NSError *error = nil;
    //NSManagedObjectContext *context = self.managedObjectContext;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error ! %@",error);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //to reload table
    //[self.tableView reloadData];
}

-(void)addCourseViewControllerDidCancel:(Course *)courseToDelete
{

    //NSManagedObjectContext *context = self.managedObjectContext;
    [self.managedObjectContext deleteObject:courseToDelete];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    id<NSFetchedResultsSectionInfo> secInfo = [[self.fetchedResultsController sections]objectAtIndex:section];
    return [secInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Course *course = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = course.title;
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [[[self.fetchedResultsController sections]objectAtIndex:section]name];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }
     if (editingStyle == UITableViewCellEditingStyleDelete) {
         NSManagedObjectContext *context = [self managedObjectContext];
         Course *courseToDelete = [self.fetchedResultsController objectAtIndexPath:indexPath];
         [context deleteObject:courseToDelete];
         
         NSError *error = nil;
         if (![context save:&error]) {
             NSLog(@"Error ! %@",error);
         }
     }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark -
#pragma mark Fetched Controller section

-(NSFetchedResultsController *)fetchedResultsController{

    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Course" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify how the fetched objects should be sorted
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"author"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"author" cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
    

}

-(void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    
    UITableView *tableView = self.tableView;
    switch (type) {
        case NSFetchedResultsChangeInsert:
        {
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];

        }
            break;
        case NSFetchedResultsChangeDelete:
        {
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
            break;
        case NSFetchedResultsChangeUpdate:
        {
            Course *changedCourse = [self.fetchedResultsController objectAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = changedCourse.title;
        }
            break;
        case NSFetchedResultsChangeMove:
        {
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
            break;
    }

}

-(void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{

    switch (type) {
        case NSFetchedResultsChangeInsert:
        {
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        }
        break;
            
        case NSFetchedResultsChangeDelete:
        {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
        }
        break;
        default:
        break;
    }

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"addCourse"]) {
        AddCourseViewController *acvc = (AddCourseViewController *)[segue destinationViewController];
        acvc.delegate=self;
        
        Course *newCourse = (Course *)[NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:[self managedObjectContext]];
        acvc.currentCourse = newCourse;
    }
    if ([[segue identifier]isEqualToString:@"showDetail"]) {
        DisplayEditViewController *dvc = (DisplayEditViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Course *selectedCourse = (Course *)[self.fetchedResultsController objectAtIndexPath:indexPath];
        dvc.currnetCourse = selectedCourse;
    }
}


@end
