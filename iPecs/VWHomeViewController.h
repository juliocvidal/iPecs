//
//  VWHomeViewController.h
//  iPecs
//
//  Created by Julio Vidal on 2/4/14.
//  Copyright (c) 2014 vw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "soundQueue.h"

@interface VWHomeViewController : UIViewController

@property soundQueue *queue;

@property NSMutableArray *originalQueue;

@property NSMutableArray *images;
@property NSMutableArray *buttons;

@end
