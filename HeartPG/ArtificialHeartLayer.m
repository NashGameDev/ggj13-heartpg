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

@end
