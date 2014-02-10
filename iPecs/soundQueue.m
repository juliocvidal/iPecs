//
//  soundQueue.m
//  TapAndSound
//
//  Created by Laercio Wadie on 2/4/14.
//  Copyright (c) 2014 Laercio Wadie. All rights reserved.
//

#import "soundQueue.h"
#import <AudioToolbox/AudioToolbox.h>


@implementation soundQueue
@synthesize sndQueue;

-(id)init
{
    if (self = [super init])
    {
        sndQueue = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id)initWithArray:(NSMutableArray *)arraySound
{
    self = [self init];
    if (self!=nil){
        [sndQueue addObjectsFromArray:arraySound];
    }
    return self;
}

-(void)addSoundToQueue:(NSString*)snd
{
    [sndQueue addObject:snd];
}

-(NSString*)getSoundFromQueue
{
    if(sndQueue.count > 0){
        NSString* snd;
        snd = [sndQueue objectAtIndex:0]; //1st sound
        [sndQueue removeObjectAtIndex:0];
        return snd;
    }else{
        return NULL;
    }
    
}

void MyAudioServicesSystemSoundCompletionProc(SystemSoundID ssID, void *clientData)
{
    //cleanup
    AudioServicesDisposeSystemSoundID(ssID);
    soundQueue* pSoundQueue = (__bridge soundQueue *)(clientData);
    [pSoundQueue playQueue]; //it crashes here: EXC_BAD_ACCESS
}

-(void)playQueue
{
    NSString *nextSound = [self getSoundFromQueue];
    if (nextSound != NULL) {
        NSString *path = [[NSBundle mainBundle] pathForResource:nextSound ofType:@"mp3"];
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path], &soundID);
        AudioServicesAddSystemSoundCompletion (soundID,NULL,NULL,MyAudioServicesSystemSoundCompletionProc, /*(void*)*/ (__bridge void *)(self));
        AudioServicesPlaySystemSound (soundID);	
    }
}

@end