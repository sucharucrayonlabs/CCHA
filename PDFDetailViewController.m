//
//  PDFDetailViewController.m
//  CCHA App
//
//  Created by Zack Baker on 1/14/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "PDFDetailViewController.h"

@interface PDFDetailViewController ()

@end

@implementation PDFDetailViewController

@synthesize PDFWebView;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestingDoc" ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [PDFWebView loadRequest:request];
    [PDFWebView setScalesPageToFit:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
