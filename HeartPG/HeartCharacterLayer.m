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
        self.heart = [HeartNode node];
        [self addChild:self.heart];        
        
        self.pump = [CCSprite spriteWithFile:@"Icon.png"];
        self.pump.anchorPoint = ccp(0.5, 0);
        self.pump.position = ccp(0, -self.contentSize.height/2);
        CGSize size = self.pump.contentSize;
        self.pump.touchRect = CGRectInset(CGRectMake(0, 0, size.width, size.height), -size.width, -size.height);

        [self addChild:self.pump];
    }
    
	return self;
}

@end
