//
//  LoginViewController.h
//  MonsterBench
//
//  Created by Joseph Reese on 11/2/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KinveyKit/KinveyKit.h>

@interface LoginViewController : UIViewController <KCSUserActionDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;


@end
