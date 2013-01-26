//
//  SoundEffects.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

FOUNDATION_EXPORT NSString * const kEggDeath;
FOUNDATION_EXPORT NSString * const kEvilLaugh1;
FOUNDATION_EXPORT NSString * const kEvilLaugh2;
FOUNDATION_EXPORT NSString * const kPumpingUp;
FOUNDATION_EXPORT NSString * const kScrambleYou;
FOUNDATION_EXPORT NSString * const kTasteMyBacon;
FOUNDATION_EXPORT NSString * const kHeartbeatTap;
FOUNDATION_EXPORT NSString * const kHeartbeatTap;
FOUNDATION_EXPORT NSString * const kPumping1Bleep;
FOUNDATION_EXPORT NSString * const kPumping2Bleeps;



@interface SoundEffects : NSObject {
    
}

+(void) preload;

@end
