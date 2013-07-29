//
//  SecondVC.m
//  ReachibiltyDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "SecondVC.h"
#import "FirstVC.h"

@interface SecondVC ()

@end

@implementation SecondVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"SecondVC_iPhone4" bundle:nibBundleOrNil];
    } else {
        self = [super initWithNibName:@"SecondVC_iPad" bundle:nibBundleOrNil];    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Second View Controller";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnFirstVCIsClicked:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
