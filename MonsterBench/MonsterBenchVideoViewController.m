//
//  MonsterBenchViewController.m
//  MonsterBench
//
//  Created by Joseph Reese on 10/27/12.
//  Copyright (c) 2012 ISYS. All rights reserved.
//

#import "MonsterBenchVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <KinveyKit/KinveyKit.h>

@interface MonsterBenchVideoViewController ()
@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;
@end

@implementation MonsterBenchVideoViewController

@synthesize streamPlayer = _streamPlayer;
@synthesize objectname = _objectname;


#pragma mark - view methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [KCSResourceService getStreamingURLForResource:self.objectname withResourceDelegate:self];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - KCSCollection Delegate Results 

-(void)resourceServiceDidFailWithError:(NSError *)error
{
    //error handling ...
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video Unavailable" message:@" Please Try Again Later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
}

- (void)resourceServiceDidCompleteWithResult: (KCSResourceResponse *)result
{
    NSURL *stream = [NSURL URLWithString:[result streamingURL]];
    
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:stream];
    
    
    [self.streamPlayer.view setFrame: self.view.bounds ];
    
    self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
    
    [self.view addSubview: self.streamPlayer.view];
    
    [self.streamPlayer play];
    
}

@end
