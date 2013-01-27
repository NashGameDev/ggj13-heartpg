//
//  EnemyCharacterLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "EnemyCharacterLayer.h"


@implementation EnemyCharacterLayer
-(id) init
{
	if( (self=[super init]) ) {
        self.enemyGraphic = [CCSprite spriteWithSpriteFrameName:@"baconegg.png"];
        [self addChild:self.enemyGraphic];
	}
    
	return self;
}

-(void) hitSide {
    self.enemyGraphic.scale /= 2.0;
    
    CCParticleExplosion* particle = [CCParticleExplosion node];
    particle.speed = 800.0;
    particle.life = 0.5;
    particle.lifeVar = 0.1;
    particle.position = ccp(0,0);
    [self addChild:particle];

}

-(void) hitUp {
    
}


@end
