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

NSString * const kEggDeath = @"EggDeath.caf";
NSString * const kEvilLaugh1 = @"EvilLaugh1.caf";
NSString * const kEvilLaugh2 = @"EvilLaugh2.caf";
NSString * const kPumpingUp = @"PumpingUp.caf";
NSString * const kScrambleYou = @"ScrambleYou.caf";
NSString * const kTasteMyBacon = @"TasteMyBacon.caf";
NSString * const kHeartbeatTap = @"Heartbeat-Tap.caf";
NSString * const kPumping1Bleep = @"Pumping-1Bleep.caf";
NSString * const kPumping2Bleeps = @"Pumping-2Bleeps.caf";


+(void) preload {
    SimpleAudioEngine *engine = [SimpleAudioEngine sharedEngine];
    NSArray* allSounds = @[kEggDeath, kEvilLaugh1, kEvilLaugh2, kPumpingUp, kScrambleYou, kTasteMyBacon, kHeartbeatTap,
    kPumping1Bleep, kPumping2Bleeps];

    for( NSString* effect in allSounds) {
        [engine preloadEffect:effect];
    }
}

@end
