//
//  HeartCharacterLayer.m
//  HeartPG
//
//  Created by Christopher Cotton on 1/26/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "HeartCharacterLayer.h"

#define kMaxCharacterHealth 100

@implementation HeartCharacterLayer

-(id) init
{
	if( (self=[super init]) ) {
        self.heart = [HeartNode node];
        [self addChild:self.heart];        
        
        self.pump = [CCSprite spriteWithSpriteFrameName:@"pump.png"];
        self.pump.anchorPoint = ccp(0.5, 0);
        self.pump.position = ccp(0, -self.contentSize.height/2);
        CGSize size = self.pump.contentSize;
        self.pump.touchRect = CGRectInset(CGRectMake(0, 0, size.width, size.height), -size.width, -size.height);
        [self addChild:self.pump];
        
        self.bagtop = [CCSprite spriteWithSpriteFrameName:@"bloodbag.png"];
        self.bagtop.scale =  0.6;
        self.bagtop.flipY = YES;
        self.bagtop.anchorPoint = ccp(0, 0);
        self.bagtop.position = ccp(-self.contentSize.width/4, self.contentSize.height/2 - self.bagtop.contentSize.height * self.bagtop.scale);
        [self addChild:self.bagtop];

        self.bagbottom = [CCSprite spriteWithSpriteFrameName:@"bloodbag2.png"];
        self.bagbottom.scale =  0.6;
        self.bagbottom.flipY = YES;
        self.bagbottom.anchorPoint = ccp(0, 0);
        self.bagbottom.position = ccp(-self.contentSize.width/4, self.contentSize.height/2 - self.bagbottom.contentSize.height * self.bagbottom.scale);
        self.bagbottom.contentSize = CGSizeMake(self.bagbottom.contentSize.width, 200);
        self.bagbottom.textureRect = CGRectMake(self.bagbottom.textureRect.origin.x, self.bagbottom.textureRect.origin.y, self.bagbottom.textureRect.size.width, 200);
        [self addChild:self.bagbottom];
        self.health = kMaxCharacterHealth;

    }
    
	return self;
}

-(void) setHealth:(NSInteger)health {
    _health = health;
    self.bagbottom.contentSize = CGSizeMake(self.bagbottom.contentSize.width, 200);
    self.bagbottom.textureRect = CGRectMake(self.bagbottom.textureRect.origin.x, self.bagbottom.textureRect.origin.y, self.bagbottom.textureRect.size.width, self.bagtop.textureRect.size.height * (double) health / kMaxCharacterHealth);
}

@end
