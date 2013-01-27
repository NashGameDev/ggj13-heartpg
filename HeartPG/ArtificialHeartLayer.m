//
//  ArtificialHeartLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ArtificialHeartLayer.h"
#import "SoundEffects.h"

@implementation ArtificialHeartLayer

-(NSString*) characterFrameName {
    return @"heartbot.png";
}

-(void) playDyingEffect {
    [[SimpleAudioEngine sharedEngine] playEffect:kArtificialMalfunctioning];
}

-(void) playStartingEffect {
    [[SimpleAudioEngine sharedEngine] playEffect:kArtificialReplacement];
}

-(void) playHitEffect {

    switch(arc4random() % 3) {
        case 0:
            [[SimpleAudioEngine sharedEngine] playEffect:kArtificial123456];
            break;
        case 1:
            [[SimpleAudioEngine sharedEngine] playEffect:kArtificialOperational];
            break;
        case 2:
            [[SimpleAudioEngine sharedEngine] playEffect:kArtificialTermination];
            break;
    }
}
@end
