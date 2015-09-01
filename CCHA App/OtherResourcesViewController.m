//
//  OtherResourcesViewController.m
//  CCHA App
//
//  Created by Zack Baker on 4/28/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "OtherResourcesViewController.h"

@interface OtherResourcesViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *othersScrollViewIPAD;

@end

@implementation OtherResourcesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (IBAction)ideoPush:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.doe.in.gov/" forKey:@"urlPressed"];
}

- (IBAction)agaPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.in.gov/attorneygeneral/2352.htm" forKey:@"urlPressed"];
}

- (IBAction)EERpressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.in.gov/ieerb/index.htm" forKey:@"urlPressed"];
}

- (IBAction)iPacPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.in.gov/pac/" forKey:@"urlPressed"];
}

- (IBAction)ISBOApressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.in.gov/sboa/2821.htm" forKey:@"urlPressed"];
}

- (IBAction)gfPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.in.gov/dlgf/2351.htm" forKey:@"urlPressed"];
}

- (IBAction)thisPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.isba-ind.org/" forKey:@"urlPressed"];
}

- (IBAction)readRoomPressed:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www2.ed.gov/about/offices/list/ocr/publications.html" forKey:@"urlPressed"];
}

- (IBAction)depOfLab:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"http://www.dol.gov/dol/topic/" forKey:@"urlPressed"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.othersScrollViewIPAD.contentSize = self.othersScrollViewIPAD.frame.size;
    if(self.othersScrollViewIPAD.isScrollEnabled)
    {
        NSLog(@"YES!!!");
        
    }
    else
    {
    
        NSLog(@"NO :(");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
