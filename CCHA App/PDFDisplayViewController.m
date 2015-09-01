//
//  PDFDisplayViewController.m
//  CCHA App
//
//  Created by Zack Baker on 1/16/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "PDFDisplayViewController.h"

@interface PDFDisplayViewController ()

@end

@implementation PDFDisplayViewController

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
    PDFDisplayWebView.scalesPageToFit=YES;
    
    pdfFileName=[[NSUserDefaults standardUserDefaults] objectForKey:@"pdfFileName"];
    
    NSString *pdfFileAddress=[[NSBundle mainBundle] pathForResource:pdfFileName ofType:@"pdf"];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"School Law App" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    NSString *resource = [bundle pathForResource:pdfFileName ofType:@"pdf"];
    
    NSURL *url=[NSURL fileURLWithPath:pdfFileAddress];
    NSURLRequest *requestObj=[NSURLRequest requestWithURL:url];
    [PDFDisplayWebView loadRequest:requestObj];
    
    starBarButton=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bookmark_add_24.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(pressedStarButton:)];
    
    NSArray *tempArray2=[[NSArray alloc] initWithObjects:starBarButton, nil];
    self.navigationItem.rightBarButtonItems=tempArray2;
    
    favPDFArray=[NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"favoritesArraySaved"]];
    
    if([favPDFArray containsObject:pdfFileName])
    {
        starBarButton.image=[UIImage imageNamed:@"bookmark_24.png"];
    }
    else
    {
        starBarButton.image=[UIImage imageNamed:@"bookmark_add_24.png"];
    }
    
    [super viewDidLoad];
}

-(IBAction)pressedStarButton:(id)sender
{
    NSData *imgdata1=UIImagePNGRepresentation(starBarButton.image);
    NSData *imgdata2=UIImagePNGRepresentation([UIImage imageNamed:@"bookmark_add_24.png"]);
    
    if([imgdata1 isEqualToData:imgdata2])
    {
        starBarButton.image=[UIImage imageNamed:@"bookmark_24.png"];
        [favPDFArray addObject:pdfFileName];
        
        [[NSUserDefaults standardUserDefaults] setObject:favPDFArray forKey:@"favoritesArraySaved"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Added To Favorites" message:@"You added this file to your favorites which can be accessed on the home screen."delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        starBarButton.image=[UIImage imageNamed:@"bookmark_add_24.png"];
        [favPDFArray removeObject:pdfFileName];
        
        [[NSUserDefaults standardUserDefaults] setObject:favPDFArray forKey:@"favoritesArraySaved"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Removed From Favorites" message:@"You removed this file from your favorites which can be accessed on the home screen."delegate:nil cancelButtonTitle:@"OK"otherButtonTitles:nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
