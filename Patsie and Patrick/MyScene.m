//
//  MyScene.m
//  4physicsBodys_Linked_By_RopeJoint
//
//  Created by YG on 2/17/14.
//  Copyright (c) 2014 YuryGitman. All rights reserved.


#import "MyScene.h"

typedef NS_OPTIONS(uint32_t, CNPhysicsCategory)
{
    CNPhysicsCategoryCat = 1 << 0, //0001 = 1, pg. 245
    CNPhysicsCategoryBlock = 1 << 1, //0010 = 2
    CNPhysicsCategoryBed = 1 << 2, //0100 = 4
};

@interface MyScene()

@property SKSpriteNode* myCircle9;


@end

@implementation MyScene

{
    SKNode *_gameNode;
    SKSpriteNode *_background;
    SKSpriteNode *_l1patsiepatrick;
    SKSpriteNode *_l1patsiepatrickannoyed;
    SKSpriteNode *_l1patsiepatricktickedoff;
    SKSpriteNode *_l1patsiepatricktickangry;
    SKSpriteNode *_badpresent1;
    SKSpriteNode *_badpresent2;
    SKSpriteNode *_badpresent3;
    
    int _currentLevel;
}




-(void) presents{
    
    _myCircle9 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(30, 30)];
    
    [_myCircle9 setPosition:CGPointMake(300, 200)];
    
    _myCircle9.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myCircle9.size];
    
    [_myCircle9.physicsBody setDynamic:YES];
    [self addChild:_myCircle9];

    
}



-(id)initWithSize:(CGSize)size {
    
    // NEED TO PUT IMAGES IN THE FILE W/ CORRECT NAMES
    _background = [SKSpriteNode spriteNodeWithImageNamed:@"L1Background1"];
    _background.position = CGPointMake(self.size.width * 0.50,
                                       self.size.height * 0.50);
    _l1patsiepatrick = [SKSpriteNode spriteNodeWithImageNamed:@"L1PatsiePatrick"];
    _l1patsiepatrick.position = CGPointMake(self.size.width * 0.32,
                                            self.size.height * 0.38);
    
    [self addChild:_background];
    [self addChild:_l1patsiepatrick];
    
    _myCircle9 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(20, 20)];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
    {
        [super touchesBegan:touches withEvent:event];
        
        // 1
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self];
        
        [_myCircle9 removeFromParent];
        
        // 2
        [self.physicsWorld enumerateBodiesAtPoint:location
                                       usingBlock:
         ^(SKPhysicsBody *body, BOOL *stop) {
             // 3
             if (body.categoryBitMask == CNPhysicsCategoryBlock) {
                 [body.node removeFromParent];
                 *stop = YES; // 4
                 
                 // 5
                 [self runAction:[SKAction playSoundFileNamed:@"pop.mp3"
                                            waitForCompletion:NO]];
             }
         }];
        
    }

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    }

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    }


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
