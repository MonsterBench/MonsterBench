//
//  KinveyVideoData.h
//  MonsterBench
//
//  Created by Joseph Reese on 10/31/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KinveyKit/KinveyKit.h>

@interface KinveyVideoData : NSObject <KCSPersistable>

@property (retain, nonatomic) NSString *objectId;
@property (retain, nonatomic) NSString *objectname;
@property (retain, nonatomic) NSString *Category;
@property (retain, nonatomic) NSString *Subcategory;
@property (retain, nonatomic) NSString *kmd;
@property (retain, nonatomic) NSString *acl;
@property (retain, nonatomic) NSString *videoname;


@end
