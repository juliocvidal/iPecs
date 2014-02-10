//
//  soundQueue.h
//  TapAndSound
//
//  Created by Laercio Wadie on 2/4/14.
//  Copyright (c) 2014 Laercio Wadie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface soundQueue : NSObject {
    NSMutableArray *sndQueue;
}
@property(nonatomic, retain) NSMutableArray *sndQueue;

-(id)init;

-(id)initWithArray:(NSMutableArray *)arraySound;

-(void)addSoundToQueue:(NSString*)snd;

-(NSString*)getSoundFromQueue;

-(void)playQueue;

@end