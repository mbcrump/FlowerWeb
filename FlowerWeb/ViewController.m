//
//  ViewController.m
//  FlowerWeb
//
//  Created by Michael Crump on 7/14/13.
//  Copyright (c) 2013 Michael Crump. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 
    [self.flowerDetailView setHidden:YES];
	[self getFlower:nil];

    [self.activityView setHidesWhenStopped:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getFlower:(id)sender {
    NSURL *imageURL;
	NSURL *detailURL;
	NSString *detailURLString;
   
    [self.activityView startAnimating];
    
    self.flowerImageView.image = nil;
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *color=[self.colorChoice titleForSegmentAtIndex:
                     self.colorChoice.selectedSegmentIndex];
	int sessionID=random()%50000;
	
	NSString *imageURLString=[[NSString alloc] initWithFormat:
                              @"http://www.floraphotographs.com/showrandomios.php?color=%@&session=%d"
                              ,color,sessionID];

    [[session dataTaskWithURL:[NSURL URLWithString:imageURLString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        [self.flowerImageView setImage:[UIImage imageWithData:data]];
        
        [self.activityView stopAnimating];
        
    }] resume];
    
    
    detailURLString=[[NSString alloc] initWithFormat:
					 @"http://www.floraphotographs.com/detailios.php?color=%@&session=%d"
                     ,color,sessionID];
    
	imageURL=[[NSURL alloc] initWithString:imageURLString];
	detailURL=[[NSURL alloc] initWithString:detailURLString];
    
	[self.flowerDetailView loadRequest:[NSURLRequest requestWithURL:detailURL]];
}

- (IBAction)toggleFlowerDetail:(id)sender {
    self.flowerDetailView.hidden=![sender isOn];
	/*
     if ([sender isOn]) {
     flowerDetailView.hidden=NO;
     } else {
     flowerDetailView.hidden=YES;
     }
     */
}

@end
