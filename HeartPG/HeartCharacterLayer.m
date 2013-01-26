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
        
        CCSprite* sprite = [CCSprite spriteWithFile:@"Icon.png"];
        sprite.anchorPoint = ccp(0.5, 0);
        sprite.position = ccp(0, -self.contentSize.height/2);
        [self addChild:sprite];

        
        UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
        [sprite addGestureRecognizer:tapGestureRecognizer];
        tapGestureRecognizer.delegate = self;
                
        UIGestureRecognizer *panGestureRecognizer2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        panGestureRecognizer2.delegate = self;
        [sprite addGestureRecognizer:panGestureRecognizer2];
	}
    
	return self;
}

#pragma mark - GestureRecognizer delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handlePanGesture:(UIPanGestureRecognizer*)aPanGestureRecognizer
{
    CCNode *node = aPanGestureRecognizer.node;
    CGPoint translation = [aPanGestureRecognizer translationInView:aPanGestureRecognizer.view];
    translation.y *= -1;
    [aPanGestureRecognizer setTranslation:CGPointZero inView:aPanGestureRecognizer.view];
    
    node.position = ccpAdd(node.position, translation);
}

- (void)handlePinchGesture:(UIPinchGestureRecognizer*)recognizer {
    
}

- (void)handleTapGesture:(UITapGestureRecognizer*)recognizer {
    [self.heart pump:kBasicPump];
}



@end
