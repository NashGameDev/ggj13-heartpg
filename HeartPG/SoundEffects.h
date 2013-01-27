//
//  SoundEffects.h
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

// Dir.glob("Assets/**/*.caf").each {|x| puts "FOUNDATION_EXPORT NSString * const k#{File.basename(x).gsub('-', '').gsub('.caf', '')};" }

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"

FOUNDATION_EXPORT NSString * const kAttackGenericHit;
FOUNDATION_EXPORT NSString * const kBattleThemeLose;
FOUNDATION_EXPORT NSString * const kBattleThemeWin;
FOUNDATION_EXPORT NSString * const kArtificial123456;
FOUNDATION_EXPORT NSString * const kArtificialMalfunctioning;  // dying sound   2.25
FOUNDATION_EXPORT NSString * const kArtificialOperational;
FOUNDATION_EXPORT NSString * const kArtificialReplacement;     // starting sound  2.5
FOUNDATION_EXPORT NSString * const kArtificialTermination;
FOUNDATION_EXPORT NSString * const kEggBacon;
FOUNDATION_EXPORT NSString * const kEggDeath;                   // dying sound    2.5
FOUNDATION_EXPORT NSString * const kEggEvilLaugh;
FOUNDATION_EXPORT NSString * const kEggEvilLaugh2;
FOUNDATION_EXPORT NSString * const kEggScrambleYou;             // starting sound  2.0
FOUNDATION_EXPORT NSString * const kEnemyAttack1;
FOUNDATION_EXPORT NSString * const kHeartbeatTap;
FOUNDATION_EXPORT NSString * const kPlayerDeath;
FOUNDATION_EXPORT NSString * const kPlayerEffortsInVein;
FOUNDATION_EXPORT NSString * const kPlayerKarate1;
FOUNDATION_EXPORT NSString * const kPlayerKarate2;
FOUNDATION_EXPORT NSString * const kPlayerWhyAorta;
FOUNDATION_EXPORT NSString * const kPlayerAttack1Hit;
FOUNDATION_EXPORT NSString * const kPlayerAttack1Launch;
FOUNDATION_EXPORT NSString * const kPlayerAttack2;
FOUNDATION_EXPORT NSString * const kPumping1Bleep;
FOUNDATION_EXPORT NSString * const kPumping2Bleeps;
FOUNDATION_EXPORT NSString * const kPumpingUpAlternate;
FOUNDATION_EXPORT NSString * const kPumpingUp;



@interface SoundEffects : NSObject {
    
}

+(void) preload;

@end
