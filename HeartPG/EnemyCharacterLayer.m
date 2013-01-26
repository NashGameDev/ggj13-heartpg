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
        CCSprite* sprite = [CCSprite spriteWithSpriteFrameName:@"baconegg.png"];
        [self addChild:sprite];
	}
    
	return self;
}

@end
