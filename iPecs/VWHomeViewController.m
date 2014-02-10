//
//  VWHomeViewController.m
//  iPecs
//
//  Created by Julio Vidal on 2/4/14.
//  Copyright (c) 2014 vw. All rights reserved.
//

#import "VWHomeViewController.h"

@interface VWHomeViewController ()

@end

@implementation VWHomeViewController

NSInteger itens = 0;

-(IBAction)playQueueSound:(id)sender
{
    NSLog(@"play queue");
    soundQueue *result = [self.queue initWithArray:self.originalQueue];
    
    [self.queue playQueue];
    
    NSLog(@"result - %@", result);
    
}

-(IBAction)removeQueue:(id)sender
{
    NSLog(@"remove queue");
    
    [self.originalQueue removeAllObjects];
    [self.images removeAllObjects];
    [self.buttons removeAllObjects];
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    NSString *buttonName = [sender currentTitle];
    
    if ([buttonName isEqualToString:@"back"])
    {
        [self.originalQueue removeLastObject];
        [self.images removeLastObject];
        UIView *aView = [self.view viewWithTag:self.images.count+1];
        
        [self.view description];
        
        [aView removeFromSuperview];
        [self.buttons removeLastObject];
        
        
        NSInteger limit = ([self.view viewWithTag:1000]) ? 1 : 2;
        if(self.originalQueue.count >= limit)
        {
            NSLog(@"Segue Blocked");
            return NO;
        }
        
    }
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"play %@",[sender currentTitle]);
    
    NSString *buttonName = [sender currentTitle];
    
    if(self.originalQueue.count == 0){
        self.queue = [[soundQueue alloc] init];
        self.originalQueue = [[NSMutableArray alloc] init];
    }
    
    if(![buttonName isEqual:@"home"] && ![buttonName isEqual:@"play"] && ![buttonName isEqual:@"back"])
    {
        [self.originalQueue addObject:buttonName];
        [self play:sender];
        [self addImageToList:segue sender:sender];
        
    }else if ([buttonName isEqual:@"home"])
    {
        [self removeQueue:sender];
    }
    
    NSLog(@"%u", self.originalQueue.count);
    VWHomeViewController * nextView = segue.destinationViewController;
    nextView.queue = self.queue;
    nextView.originalQueue = self.originalQueue;
    NSLog(@"%u", self.originalQueue.count);
    NSLog(@"%u", nextView.originalQueue.count);
    nextView.images = self.images;
    nextView.buttons = self.buttons;
    
}

-(void)addImageToList:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([self.images count] == 0)
    {
        self.images = [[NSMutableArray alloc] init];
    }
    [self.images addObject:[sender currentTitle]];
}

-(IBAction)playAndAddToTimeLine:(id)sender
{
    [self.originalQueue addObject:[sender currentTitle]];
    [self play:sender];
    [self addImageToTimeLine:[sender currentTitle] pos:itens];
    itens++;
    [self.images addObject:[sender currentTitle]];
}

-(IBAction)play:(id)sender
{
    SystemSoundID soundId;
    NSString *buttonName = [sender currentTitle];
    NSString *soundFile = [[NSBundle mainBundle] pathForResource:buttonName ofType:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:soundFile], &soundId);
    AudioServicesPlaySystemSound(soundId);
}

-(void)addImageToTimeLine:(NSString *)imageName pos:(NSInteger)pos
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:imageName forState:UIControlStateNormal];
    [button addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:[imageName stringByAppendingString:@".jpg"]] forState:UIControlStateNormal];
    button.frame = CGRectMake(itens * 110 + 40.0f, 27.0f, 101.0f, 103.0f);
    button.tag = itens + 1;
    [self.view addSubview:button];
    [self.buttons addObject:button];
}

-(void)drawTimeLine:(NSMutableArray *)images
{
    for (itens = 0; itens < [images count]; itens++) {
        [self addImageToTimeLine:[images objectAtIndex:itens] pos:itens];
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
    NSLog(@"entrou no did load");
    [self drawTimeLine:self.images];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
