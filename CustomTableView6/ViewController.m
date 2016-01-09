//
//  ViewController.m
//  CustomTableView6
//
//  Created by Quazi Ridwan Hasib on 9/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

@interface ViewController ()
{
    NSArray *lg;
    NSArray *lblTxt1;
    NSArray *lblTxt2;
    int a;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    lg = [[NSArray alloc] initWithObjects:@"image1.png" , @"image2.png", @"image3.png", @"image4.png", nil];
    lblTxt1 = [[NSArray alloc] initWithObjects:@"a" , @"b", @"c", @"d", nil];
    lblTxt2 = [[NSArray alloc] initWithObjects:@"q" , @"w", @"e", @"r", nil];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return lblTxt1.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.labelTxt1.text = [lblTxt1 objectAtIndex:indexPath.row];
    cell.labelTxt2.text = [lblTxt2 objectAtIndex:indexPath.row];
    cell.tView.image = [UIImage imageNamed:[lg objectAtIndex: indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    a=indexPath.row;
    NSLog(@"aaaaa: %d", a);
    
    NSString *selectedValue1 = [lblTxt1 objectAtIndex:indexPath.row];
    NSLog(@"bbbbb1: %@", selectedValue1);
    
    NSString *selectedValue2 = [lblTxt2 objectAtIndex:indexPath.row];
    NSLog(@"bbbbb2: %@", selectedValue2);
    
    
    //Or you could perform the same action for all rows in a section
//    if(indexPath.section==i)
//    {
//        [[UIApplication sharedApplication]openURL:[NSURLURLWithString:@"http://www.google.com"]];
//        
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
