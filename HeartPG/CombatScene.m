//
//  CombatScene.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "CombatScene.h"

@implementation CombatScene

-(id) init
{
	if( (self=[super init]) ) {
        
        
        self.heartLayer = [HeartCharacterLayer node];
        self.heartLayer.position = ccp(self.contentSize.width/4, self.contentSize.height/2.0);
        [self addChild:self.heartLayer];
        
        self.enemyLayer = [EnemyCharacterLayer node];
        self.enemyLayer.position = ccp(self.contentSize.width/4 * 3, self.contentSize.height/2.0);
        [self addChild:self.enemyLayer];
	}
    
	return self;
}

@end
