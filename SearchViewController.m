//
//  SearchViewController.m
//  CCHA App
//
//  Created by Margaret Ward on 4/12/14.
//  Copyright (c) 2014 CCHA. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@end


@implementation SearchViewController

@synthesize searchBar;


-(void)viewDidAppear:(BOOL)animated{
    [searchBar becomeFirstResponder];
}
- (void)viewDidLoad
{
    NSString *bundleRoot=[[NSBundle mainBundle] bundlePath];
    NSFileManager *fm=[NSFileManager defaultManager];
    NSArray *dirContents=[fm contentsOfDirectoryAtPath:bundleRoot error:nil];
    NSPredicate *fltr=[NSPredicate predicateWithFormat:@"self ENDSWITH '.pdf'"];
    NSArray *onlyJPGs=[dirContents filteredArrayUsingPredicate:fltr];
    
    _arrTotalObjs=[[NSMutableArray  alloc] initWithArray:onlyJPGs];
    
    
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    if(tableView==self.searchDisplayController.searchResultsTableView)
    {
        return _arrSearchObjs.count;
    }
    else
    {
        return _arrTotalObjs.count;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *searchCell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *cellTitle=[[searchCell textLabel] text];
    
    NSUserDefaults *storeData=[NSUserDefaults standardUserDefaults];
    [storeData setObject:cellTitle forKey:@"pdfFileName"];
    [storeData synchronize];
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    [self.navigationController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"PDFView"] animated:YES];
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView;
{
    
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView;
{
    
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString;
{
    NSString *tempString=[[NSString alloc]initWithString: searchString];
    
    NSString  *value;
    NSMutableArray *tempArray=[[NSMutableArray alloc]init];
    
    for(NSInteger count=0; count<[_arrTotalObjs count];count++)
    {
        value=[_arrTotalObjs objectAtIndex:count];
        NSRange Result=[[value lowercaseString] rangeOfString:[tempString lowercaseString]];
        if(Result.length!=0)
        {
            [tempArray  addObject:value];
        }
    }
    _arrSearchObjs=[[NSMutableArray alloc] initWithArray:tempArray];
    
    return YES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *indentifier=@"Cell";
    
    UITableViewCell *cell=[tableView      dequeueReusableCellWithIdentifier:indentifier];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    if(tableView==self.searchDisplayController.searchResultsTableView)
    {
        NSString *value=[_arrSearchObjs objectAtIndex:indexPath.row];
        if([value rangeOfString:@"pdf"].location!= NSNotFound)
        {
            value=[value  stringByReplacingOccurrencesOfString:@".pdf" withString:@""];
        }
        [cell.textLabel setText:value];
    }
    else
    {
        NSString *value=[_arrTotalObjs objectAtIndex:indexPath.row];
        if([value rangeOfString:@"pdf"].location!=NSNotFound)
        {
            value=[value  stringByReplacingOccurrencesOfString:@".pdf" withString:@""];
        }
        [cell.textLabel setText:value];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
