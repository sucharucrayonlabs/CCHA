//
//  FavoriteTableViewController.m
//  CCHA App
//
//  Created by Zack Baker on 2/20/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "FavoriteTableViewController.h"

@interface FavoriteTableViewController ()

@end

@implementation FavoriteTableViewController

@synthesize thenewFavoritesArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *favcell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *favcellTitle=favcell.textLabel.text;
    
    NSUserDefaults *storeData=[NSUserDefaults standardUserDefaults];
    [storeData setObject:favcellTitle forKey:@"pdfFileName"];
    [storeData synchronize];
    
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    [self.navigationController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"PDFView"] animated:YES];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    thenewFavoritesArray=[[NSUserDefaults standardUserDefaults]objectForKey:@"favoritesArraySaved"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [thenewFavoritesArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tmpTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell=[tmpTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(nil==cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NSString *value=[thenewFavoritesArray objectAtIndex:indexPath.row];
    if([value rangeOfString:@"pdf"].location!=NSNotFound)
    {
        value=[value stringByReplacingOccurrencesOfString:@".pdf" withString:@""];
    }
    
    cell.textLabel.text=value;
    
    return cell;
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
