//
//  MonsterBenchMediaTableViewController.m
//  MonsterBench
//
//  Created by Joseph Reese on 10/31/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import "MonsterBenchMediaTableViewController.h"
#import "KinveyVideoData.h"
#import "MonsterBenchVideoViewController.h"

@interface MonsterBenchMediaTableViewController ()
@property NSArray *videolist;
@property NSString *selectedVideoObjectName;
@end

@implementation MonsterBenchMediaTableViewController
@synthesize videolist = _videolist;
@synthesize selectedVideoObjectName = _selectedVideoObjectName;

-(void)collection:(KCSCollection *)collection didCompleteWithResult:(NSArray *)result
{
    _videolist = result;
    
    
    //dynamically generates indexpath array and provides opportunity to dynamically generate new sections based on category names
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    
    for(KCSCollection *results in _videolist)
    {
        
    NSIndexPath *path = [NSIndexPath indexPathForRow:[_videolist indexOfObject:results] inSection:0];
        [indexArray addObject:path];
    }
    
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:indexArray
                          withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView endUpdates];
}

-(void)collection:(KCSCollection *)collection didFailWithError:(NSError *)error

{
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
 
   KCSCollection *myCollection = [[KCSClient sharedClient]
                                   collectionFromString:@"_blob"
                                   withClass:[KinveyVideoData class]];
    
    [myCollection fetchAllWithDelegate:self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _videolist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"MediaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    cell.textLabel.text = [[self.videolist objectAtIndex:indexPath.row] videoname];
    
    cell.detailTextLabel.text = [[self.videolist objectAtIndex:indexPath.row] Category];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        [self performSegueWithIdentifier:@"showTechniqueVideo" sender:self];
    
    _selectedVideoObjectName = [[self.videolist objectAtIndex:indexPath.row] objectname];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get reference to the destination view controller
    MonsterBenchVideoViewController *vc = [segue destinationViewController];
    // Pass any objects to the view controller here, like...
    
    
    [vc setObjectname:_selectedVideoObjectName];
}

@end
