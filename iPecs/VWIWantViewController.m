//
//  VWSecondActViewController.m
//  iPecs
//
//  Created by Julio Vidal on 2/5/14.
//  Copyright (c) 2014 vw. All rights reserved.
//

#import "VWIWantViewController.h"
#import "VWHomeViewController.h"

@interface VWIWantViewController ()

@end

@implementation VWIWantViewController

- (IBAction)openSecondActView:(UIStoryboardSegue *)segue
{
    NSLog(@"");
    VWHomeViewController *source = [segue sourceViewController];
    self.images = source.images;
    
    for (int i = 0; i < [self.images count]; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[self.images objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:[[self.images objectAtIndex:i] stringByAppendingString:@".jpg"]] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * 110 + 40.0f, 27.0f, 101.0f, 103.0f);
        [self.view addSubview:button];
    }
    
    
}

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
    NSLog(@"Did Load I want");
    NSLog(@"%@", self.image);
    for (int i = 0; i < [self.images count]; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:[self.images objectAtIndex:i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:[[self.images objectAtIndex:i] stringByAppendingString:@".jpg"]] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * 110 + 40.0f, 27.0f, 101.0f, 103.0f);
        [self.view addSubview:button];
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
