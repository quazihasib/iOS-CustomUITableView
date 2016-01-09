//
//  ViewController.h
//  CustomTableView6
//
//  Created by Quazi Ridwan Hasib on 9/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

