//
//  SoundEffects.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "SoundEffects.h"
#import "SimpleAudioEngine.h"

@implementation SoundEffects

static NSString * const kEggDeath = @"EggDeath.caf";
static NSString * const kEvilLaugh1 = @"EvilLaugh1.caf";
static NSString * const kEvilLaugh2 = @"EvilLaugh2.caf";
static NSString * const kPumpingUp = @"PumpingUp.caf";
static NSString * const kScrambleYou = @"ScrambleYou.caf";
static NSString * const kTasteMyBacon = @"TasteMyBacon.caf";

+(void) preload {
    SimpleAudioEngine *engine = [SimpleAudioEngine sharedEngine];
    NSArray* allSounds = @[kEggDeath, kEvilLaugh1, kEvilLaugh2, kPumpingUp, kScrambleYou, kTasteMyBacon];

    for( NSString* effect in allSounds) {
        [engine preloadEffect:effect];
    }
}

@end
