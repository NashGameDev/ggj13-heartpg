//
//  EggmanLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EggmanLayer.h"
#import "SoundEffects.h"

@implementation EggmanLayer


-(NSString*) characterFrameName {
    return @"baconegg.png";
}

-(void) playDyingEffect {
    [[SimpleAudioEngine sharedEngine] playEffect:kEggDeath];
}

-(void) playStartingEffect {
    [[SimpleAudioEngine sharedEngine] playEffect:kEggScrambleYou];
}


@end
