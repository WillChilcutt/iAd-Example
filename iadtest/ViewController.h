//
//  ViewController.h
//  iadtest
//
//  Created by Will Chilcutt on 5/3/12.
//  Copyright (c) 2012 ETSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>
{
    ADBannerView *adView;
    BOOL bannerIsVisible;
}

@property (nonatomic, assign) BOOL bannerIsVisible;

@end
