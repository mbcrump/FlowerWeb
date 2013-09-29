//
//  ViewController.h
//  FlowerWeb
//
//  Created by Michael Crump on 7/14/13.
//  Copyright (c) 2013 Michael Crump. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorChoice;
@property (strong, nonatomic) IBOutlet UIImageView *flowerImageView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

- (IBAction)getFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;
@end
