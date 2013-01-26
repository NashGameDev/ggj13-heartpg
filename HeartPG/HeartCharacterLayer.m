//
//  HeartCharacterLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HeartCharacterLayer.h"


@implementation HeartCharacterLayer

-(id) init
{
	if( (self=[super init]) ) {
        CCSprite* sprite = [CCSprite spriteWithFile:@"Icon.png"];
        [self addChild:sprite];
        
        self.isTouchEnabled = YES;
	}
    
	return self;
}


@end
