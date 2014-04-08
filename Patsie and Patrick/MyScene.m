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



-(void) presents{
    
    _myCircle9 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(30, 30)];
    
    [_myCircle9 setPosition:CGPointMake(300, 200)];
    
    _myCircle9.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myCircle9.size];
    
    [_myCircle9.physicsBody setDynamic:YES];
    [self addChild:_myCircle9];

    
}



-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
        
      //  self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self.physicsBody setRestitution:0.0];
        
        
        [self presents];
        
        
        
    }
    return self;
}
-(void)addBlocksFromArray:(NSArray*)blocks
{
    //1 pg.241 this creates a block sprite for you
    for (NSDictionary *block in blocks) {
        
        //2
        SKSpriteNode *blockSprite =
        [self addBlockWithRect:CGRectFromString(block[@"rect"])];
        
        //have categories of blocks and cat to collide pg 245
        
        blockSprite.physicsBody.categoryBitMask =
        CNPhysicsCategoryBlock | CNPhysicsCategoryCat;
        
        blockSprite.physicsBody.collisionBitMask =
        CNPhysicsCategoryBlock;
        
        
    }// forNSDictionary
}//addblocksarray

-(SKSpriteNode*)addBlockWithRect:(CGRect)blockRect

//whats the difference between CGRect and block rect?

{
    //3
    NSString *textureName = [NSString stringWithFormat:@"%.fx%.f.png",blockRect.size.width, blockRect.size.height];
    //4
    SKSpriteNode *blockSprite =
    [SKSpriteNode spriteNodeWithImageNamed:textureName];
    blockSprite.position = blockRect.origin;
    
    //5 make blockrect smaller by 2x2 = body rect,
    
    CGRect bodyRect = CGRectInset(blockRect, 2, 2);
    blockSprite.physicsBody =
    [SKPhysicsBody bodyWithRectangleOfSize:bodyRect.size];
    
    //6
    //[blockSprite attachDebugRectWithSize:blockSprite.size];
    
    return blockSprite;
}//blockwithrect pg.242

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
