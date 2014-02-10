//
//  VWGeneralNavigationControllerViewController.m
//  iPecs
//
//  Created by Julio Vidal on 2/6/14.
//  Copyright (c) 2014 vw. All rights reserved.
//

#import "VWGeneralNavigationController.h"

@interface VWGeneralNavigationController ()

@end

@implementation VWGeneralNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self setNavigationBarHidden:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
