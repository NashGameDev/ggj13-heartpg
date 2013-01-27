//
//  EnemyCharacterLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyCharacterLayer.h"
#import "SoundEffects.h"

#define kMAX_HEALTH  100
#define kSIDE_HIT 10

@implementation EnemyCharacterLayer
-(id) init
{
	if( (self=[super init]) ) {
        self.enemyGraphic = [CCSprite spriteWithSpriteFrameName:[self characterFrameName]];
        [self addChild:self.enemyGraphic];
        self.health = kMAX_HEALTH;
	}
    
	return self;
}

-(void)setHealth:(NSInteger)health {
    _health = health;
    if (_health < 0) {
        _health = 0;
    }

    [self.enemyGraphic setColor:ccc3(255.0, 255.0 * _health / kMAX_HEALTH, 255.0 * _health / kMAX_HEALTH)];
}

-(void) hitSide:(NSInteger)characterPower {
    self.health -= kSIDE_HIT;
    
    CCParticleExplosion* particle = [CCParticleExplosion node];
    particle.speed = 800.0;
    particle.life = 0.5;
    particle.lifeVar = 0.1;
    particle.position = ccp(0,0);
    [self addChild:particle];
    
    [[SimpleAudioEngine sharedEngine] playEffect:kPlayerKarate2];
}

-(void) hitUp:(NSInteger)characterPower {
    
}

-(NSString*) characterFrameName {
    return nil;
}

-(void) playDyingEffect {
    
}

-(void) playStartingEffect {
    
}

-(void) playHitEffect {
    
}

@end
