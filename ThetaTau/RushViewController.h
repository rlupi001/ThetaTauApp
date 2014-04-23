//
//  RushViewController.h
//  ThetaTau
//
//  Created by David Oramas on 3/25/14.
//  Copyright (c) 2014 David Oramas. All rights reserved.
//

#import <UIKit/UIKit.h>

//import social framework for fb and twit
#import <Social/Social.h>

@interface RushViewController : UIViewController <UITabBarControllerDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *rushVideoView;

@property (strong, nonatomic) NSString * URL;


- (IBAction)events:(id)sender;
- (IBAction)postToFacebook:(id)sender;
- (IBAction)postToTwitter:(id)sender;


@end
