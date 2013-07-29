//
//  FirstVC.m
//  ReachibiltyDemo
//
//  Created by Magnon International on 29/07/13.
//  Copyright (c) 2013 Sumit Sharma. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self = [super initWithNibName:@"FirstVC_iPhone4" bundle:nibBundleOrNil];
    } else {
        self = [super initWithNibName:@"FirstVC_iPad" bundle:nibBundleOrNil];    }
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"View First";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIButton definition here
-(IBAction)btnSecondViewIsClicked:(id)sender{
    SecondVC *objSecondVC =[[SecondVC alloc] init];
    [self.navigationController pushViewController:objSecondVC animated:YES];
    
}

@end
