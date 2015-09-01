//
//  otherResourcesWebViewViewController.m
//  CCHA App
//
//  Created by Zack Baker on 5/3/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "otherResourcesWebViewViewController.h"

@interface otherResourcesWebViewViewController ()

@end

@implementation otherResourcesWebViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUserDefaults *prefs=[NSUserDefaults standardUserDefaults];
    NSString *fullURL=[prefs objectForKey:@"urlPressed"];
    NSURL *url=[NSURL URLWithString:fullURL];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    [self.iphoneWebViewX loadRequest:requestObj];
    [self.ipadWEbViewx loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
