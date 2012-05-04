//
//  ViewController.m
//  iadtest
//
//  Created by Will Chilcutt on 5/3/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize bannerIsVisible;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    adView = [[ADBannerView alloc]initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, 460.0f);
    adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifierPortrait];
    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    
    [self.view addSubview:adView];
    adView.delegate = self;
    
    self.bannerIsVisible=NO;
    
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(banner.frame, 0, -50.0f);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible) 
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        
        banner.frame = CGRectOffset(banner.frame, 0, 50.0f);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
