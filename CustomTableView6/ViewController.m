//
//  ViewController.m
//  CustomTableView6
//
//  Created by Quazi Ridwan Hasib on 9/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#define URL [NSURL URLWithString:@"http://quaziridwanhasib.com/getData.php"]


@interface ViewController ()
{
    NSArray *lg;
    NSArray *lblTxt1;
    NSArray *lblTxt2;
    int row;
    NSMutableArray *data2;
    NSMutableArray *arrayName;
    NSMutableArray *arrayId;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:[NSBundle mainBundle]];
//    [self.myTableView registerNib:cellNib forCellReuseIdentifier:@"CustomCell"];
    
    lg = [[NSArray alloc] initWithObjects:@"image1.png" , @"image2.png", @"image3.png", @"image4.png",
          @"image1.png" , @"image2.png", @"image3.png", @"image4.png",@"image1.png" , @"image2.png", @"image3.png", @"image4.png",@"image1.png" , @"image2.png", nil];
    lblTxt1 = [[NSArray alloc] initWithObjects:@"a" , @"b", @"c", @"d", nil];
    lblTxt2 = [[NSArray alloc] initWithObjects:@"q" , @"w", @"e", @"r", nil];
    
    //get the json data from getData method
    data2 = [self getData];
    
    //initializing 
    arrayName = [[NSMutableArray alloc] init];
    arrayId = [[NSMutableArray alloc] init];
    
    for(NSDictionary *eachEntry in data2)
    {
        NSString *names = [eachEntry objectForKey:@"name"];
        [arrayName addObject: names];
        
        NSString *ids = [eachEntry objectForKey:@"id"];
        [arrayId addObject: ids];
    }
    
    NSLog(@"TheText = %@", arrayId);
    //NSLog(@"data2: %@", data2);
    
//    [self.myTableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil]
//         forCellReuseIdentifier:@"CustomCell"];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayName.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.labelTxt1.text = [arrayName objectAtIndex:indexPath.row];
    cell.labelTxt2.text = [arrayId objectAtIndex:indexPath.row];
    cell.tView.image = [UIImage imageNamed:[lg objectAtIndex: indexPath.row]];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    row = indexPath.row;
    NSLog(@"aaaaa: %d", row);
    
    NSString *selectedValue1 = [arrayName objectAtIndex:indexPath.row];
    NSLog(@"bbbbb1: %@", selectedValue1);
    
    NSString *selectedValue2 = [arrayId objectAtIndex:indexPath.row];
    NSLog(@"bbbbb2: %@", selectedValue2);
}

-(NSMutableArray *) getData
{
    NSError* error;
    NSData* data = [NSData dataWithContentsOfURL: URL];
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    
    NSMutableArray *data1 = [[NSMutableArray alloc] init];
    data1 = [json valueForKeyPath:@"result"];
    
    //NSLog(@"data1:%@",data1);

    return data1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
