//
//  KinveyVideoData.m
//  MonsterBench
//
//  Created by Joseph Reese on 10/31/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import "KinveyVideoData.h"

@implementation KinveyVideoData

@synthesize objectId;
@synthesize objectname;
@synthesize Category;
@synthesize Subcategory;
@synthesize kmd;
@synthesize acl;
@synthesize videoname;

// Required to be overridden for Kinvey
- (NSDictionary *)hostToKinveyPropertyMapping
{
    // Only define the dictionary once
    static NSDictionary *mapping = nil;
    // If it's not initialized, initialize here
    if (mapping == nil){
        // Assign the mapping
        mapping = [NSDictionary dictionaryWithObjectsAndKeys:
                   @"_id", @"objectId",
                   @"objectname", @"objectname",
                   @"Category", @"Category",
                   @"SubCategory", @"Subcategory",
                   @"_kmd", @"kmd",
                   @"_acl", @"acl",
                   @"videoname", @"videoname",
                   nil];
    }
    return mapping;
}

@end
