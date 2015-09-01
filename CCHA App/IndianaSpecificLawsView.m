//
//  IndianaSpecificLawsView.m
//  CCHA App
//
//  Created by Zack Baker on 12/29/13.
//  Copyright (c) 2013 CCHA. All rights reserved.
//

#import "IndianaSpecificLawsView.h"
#import "PDFDisplayViewController.h"

@interface IndianaSpecificLawsView ()

@end

@implementation IndianaSpecificLawsView

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
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSString *cellTitle=cell.textLabel.text;
    
    IndianaSpecificLawsView *newTable=[[IndianaSpecificLawsView alloc] init];
    [newTable setObjDist:self.objDist];
    
    id tempObj=[self.objDist objectForKey:cellTitle];
    
    if([tempObj isKindOfClass:[NSDictionary class]]&&tempObj!=nil)
    {
        NSArray *array=[tempObj allKeys];
        array=[array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        [newTable setTableElements:array];
        [newTable setObjDist:tempObj];
    }
    else
    {
        NSUserDefaults *storeData=[NSUserDefaults standardUserDefaults];
      //  NSString *titlestring = [cellTitle stringByAppendingString:@".pdf"];
        [storeData setObject:cellTitle forKey:@"pdfFileName"];
        [storeData synchronize];
        
        UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        [self.navigationController pushViewController:[storyboard instantiateViewControllerWithIdentifier:@"PDFView"] animated:YES];
        
        return;
    }
    
    [self.navigationController pushViewController:newTable animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableElements count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    
    NSString *value=[self.tableElements objectAtIndex:indexPath.row];
    
    if([value rangeOfString:@"pdf"].location!=NSNotFound)
    {
        value=[value stringByReplacingOccurrencesOfString:@".pdf" withString:@""];
    }
    
    cell.textLabel.text=value;
    cell.textLabel.numberOfLines = 4;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 66.0f;

}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
