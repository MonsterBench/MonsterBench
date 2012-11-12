//
//  LoginViewController.m
//  MonsterBench
//
//  Created by Joseph Reese on 11/2/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userName = _userName;
@synthesize password = _password;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [self setPassword:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction)hideKeyboard:(id)sender
{
    [_password resignFirstResponder];
    [_userName resignFirstResponder];
    
}
- (IBAction)login:(id)sender
{
    [KCSUser loginWithUsername:self.userName.text password:self.password.text withDelegate:self];
    
}

- (IBAction)createNewUser:(id)sender
{
    
    if ([self.userName.text isEqualToString:@""] || [self.password.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please enter Username and Password to create account" message: @""delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        return;
    }
        

    [KCSUser userWithUsername:self.userName.text password:self.password.text withDelegate:self];
}


-(void)user:(KCSUser *)user actionDidCompleteWithResult:(KCSUserActionResult)result
{
    [self performSegueWithIdentifier:@"successfulLogin" sender:self];
}

-(void)user:(KCSUser *)user actionDidFailWithError:(NSError *)error
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@",error.localizedDescription] message:@"Please try again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
