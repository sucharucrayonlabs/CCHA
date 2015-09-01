//
//  CCHAGuidanceViewController.m
//  CCHA App
//
//  Created by Zack Baker on 4/28/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "CCHAGuidanceViewController.h"

@interface CCHAGuidanceViewController ()

@end

@implementation CCHAGuidanceViewController

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
    NSString *fullURL=@"http://www.cchalaw.com/?page_id=1196";
    NSURL *url=[NSURL URLWithString:fullURL];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    [self.newsletterWebViewiPhone loadRequest:requestObj];
    [self.newsletterWebView loadRequest:requestObj];
}

- (IBAction)backButtonTapped:(id)sender
{
    [self.newsletterWebView goBack];
    [self.newsletterWebViewiPhone goBack];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
