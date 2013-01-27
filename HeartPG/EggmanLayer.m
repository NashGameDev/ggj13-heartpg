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

-(void) playHitEffect {
    switch(arc4random() % 3) {
        case 0:
            [[SimpleAudioEngine sharedEngine] playEffect:kEggBacon];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine] playEffect:kEggEvilLaugh];
            break;
        case 2:
            [[SimpleAudioEngine sharedEngine] playEffect:kEggEvilLaugh2];
            break;
    }
}


@end
