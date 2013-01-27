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

// Dir.glob("Assets/**/*.caf").collect {|x| b = File.basename(x); n = File.basename(x).gsub('-', ''); nc = n.gsub('.caf', ''); puts "NSString * const k#{nc} = @\"#{b}\";"; "k#{nc}" }.join(", ")

NSString * const kAttackGenericHit = @"AttackGenericHit.caf";
NSString * const kBattleThemeLose = @"BattleTheme-Lose.caf";
NSString * const kBattleThemeWin = @"BattleTheme-Win.caf";
NSString * const kEggBacon = @"Egg-Bacon.caf";
NSString * const kEggDeath = @"Egg-Death.caf";
NSString * const kEggEvilLaugh = @"Egg-EvilLaugh.caf";
NSString * const kEggEvilLaugh2 = @"Egg-EvilLaugh2.caf";
NSString * const kEggScrambleYou = @"Egg-ScrambleYou.caf";
NSString * const kEnemyAttack1 = @"EnemyAttack1.caf";
NSString * const kHeartbeatTap = @"Heartbeat-Tap.caf";
NSString * const kPlayerDeath = @"Player-Death.caf";
NSString * const kPlayerEffortsInVein = @"Player-EffortsInVein.caf";
NSString * const kPlayerKarate1 = @"Player-Karate1.caf";
NSString * const kPlayerKarate2 = @"Player-Karate2.caf";
NSString * const kPlayerWhyAorta = @"Player-WhyAorta.caf";
NSString * const kPlayerAttack1Hit = @"PlayerAttack1Hit.caf";
NSString * const kPlayerAttack1Launch = @"PlayerAttack1Launch.caf";
NSString * const kPlayerAttack2 = @"PlayerAttack2.caf";
NSString * const kPumping1Bleep = @"Pumping-1Bleep.caf";
NSString * const kPumping2Bleeps = @"Pumping-2Bleeps.caf";
NSString * const kPumpingUpAlternate = @"PumpingUp-Alternate.caf";
NSString * const kPumpingUp = @"PumpingUp.caf";


+(void) preload {
    SimpleAudioEngine *engine = [SimpleAudioEngine sharedEngine];
    NSArray* allSounds = @[kAttackGenericHit, kBattleThemeLose, kBattleThemeWin, kEggBacon, kEggDeath, kEggEvilLaugh, kEggEvilLaugh2, kEggScrambleYou, kEnemyAttack1, kHeartbeatTap, kPlayerDeath, kPlayerEffortsInVein, kPlayerKarate1, kPlayerKarate2, kPlayerWhyAorta, kPlayerAttack1Hit, kPlayerAttack1Launch, kPlayerAttack2, kPumping1Bleep, kPumping2Bleeps, kPumpingUpAlternate, kPumpingUp];

    for( NSString* effect in allSounds) {
        [engine preloadEffect:effect];
    }
}

@end
