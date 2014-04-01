//
//  MyScene.m
//  4physicsBodys_Linked_By_RopeJoint
//
//  Created by YG on 2/17/14.
//  Copyright (c) 2014 YuryGitman. All rights reserved.


#import "MyScene.h"


@interface MyScene()
@property SKSpriteNode* myCircle1;
@property SKSpriteNode* myCircle2;
@property SKSpriteNode* myCircle3;
@property SKSpriteNode* myCircle4;
@property SKSpriteNode* myCircle5;
@property SKSpriteNode* myCircle6;
@property SKSpriteNode* myCircle7;
@property SKSpriteNode* myCircle8;
@property SKSpriteNode* myShelf;
@property SKPhysicsJoint* myRopeJoint;
@property SKPhysicsJoint* myRopeJoint1;
@property SKPhysicsJoint* myRopeJoint2;
@property SKPhysicsJoint* myRopeJoint3;
@property SKPhysicsJoint* myRopeJoint4;
@property SKPhysicsJoint* myRopeJoint5;
@property SKPhysicsJoint* myRopeJoint6;

@end

@implementation MyScene

-(void) activateJointRope{
    
    _myRopeJoint = [SKPhysicsJointLimit jointWithBodyA:_myCircle1.physicsBody bodyB:_myCircle2.physicsBody anchorA:_myCircle1.position anchorB:_myCircle2.position];
    
    [self.physicsWorld addJoint:_myRopeJoint];
    
    _myRopeJoint1 = [SKPhysicsJointLimit jointWithBodyA:_myCircle2.physicsBody bodyB:_myCircle3.physicsBody anchorA:_myCircle2.position anchorB:_myCircle3.position];
    
    [self.physicsWorld addJoint:_myRopeJoint1];
    
    
    _myRopeJoint2 = [SKPhysicsJointLimit jointWithBodyA:_myCircle3.physicsBody bodyB:_myCircle4.physicsBody anchorA:_myCircle3.position anchorB:_myCircle4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint2];
    
    _myRopeJoint3 = [SKPhysicsJointLimit jointWithBodyA:_myCircle4.physicsBody bodyB:_myCircle5.physicsBody anchorA:_myCircle4.position anchorB:_myCircle5.position];
    
    [self.physicsWorld addJoint:_myRopeJoint3];
    
    _myRopeJoint4 = [SKPhysicsJointLimit jointWithBodyA:_myCircle5.physicsBody bodyB:_myCircle6.physicsBody anchorA:_myCircle5.position anchorB:_myCircle6.position];
    
    [self.physicsWorld addJoint:_myRopeJoint4];
    
    _myRopeJoint5 = [SKPhysicsJointSpring jointWithBodyA:_myCircle6.physicsBody bodyB:_myCircle7.physicsBody anchorA:_myCircle6.position anchorB:_myCircle7.position];
    
    [self.physicsWorld addJoint:_myRopeJoint5];
    
    _myRopeJoint6 = [SKPhysicsJointLimit jointWithBodyA:_myCircle7.physicsBody bodyB:_myCircle8.physicsBody anchorA:_myCircle7.position anchorB:_myCircle8.position];
    
    [self.physicsWorld addJoint:_myRopeJoint6];
    
}

-(void) spawnCircles{
    _myCircle1 = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _myCircle2 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(70, 70)];
    _myCircle3 =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(70, 70)];
    _myCircle4 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(70, 70)];
    _myCircle5 =[[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _myCircle6 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(70, 70)];
    _myCircle7 =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(70, 70)];
    _myCircle8 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(70, 70)];
    
    
    [_myCircle1 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_myCircle2 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2)];
    [_myCircle3 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2.5)];
    [_myCircle4 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3)];
    [_myCircle5 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3.5)];
    [_myCircle6 setPosition:CGPointMake(self.size.width/1.5, self.size.height/4)];
    [_myCircle7 setPosition:CGPointMake(self.size.width/1.5, self.size.height/4.5)];
    [_myCircle8 setPosition:CGPointMake(self.size.width/1.5, self.size.height/5)];
    
    _myCircle1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:30];
    _myCircle2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle3.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle4.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle5.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle6.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle7.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    _myCircle8.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:5];
    
    [_myCircle1.physicsBody setRestitution:1.0];
    [_myCircle2.physicsBody setRestitution:1.0];
    [_myCircle3.physicsBody setRestitution:1.0];
    [_myCircle4.physicsBody setRestitution:1.0];
    [_myCircle5.physicsBody setRestitution:1.0];
    [_myCircle6.physicsBody setRestitution:1.0];
    [_myCircle7.physicsBody setRestitution:1.0];
    [_myCircle8.physicsBody setRestitution:1.0];
    
    [self addChild:_myCircle1];
    [self addChild:_myCircle2];
    [self addChild:_myCircle3];
    [self addChild:_myCircle4];
    [self addChild:_myCircle5];
    [self addChild:_myCircle6];
    [self addChild:_myCircle7];
    [self addChild:_myCircle8];
    
}


//-(void)makeShelf1 {
//    _myShelf1 = [[SKSpriteNode alloc]initWithColor:[SKColor lightGrayColor] size:CGSizeMake(100, 40)];
//    _myShelf1.position = CGPointMake(self.size.width/1.4, self.size.height/4);
//    _myShelf1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myShelf1.size];
//    [_myShelf1.physicsBody setDynamic:NO];
//
//    [self addChild:_myShelf1];
//
//}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self.physicsBody setRestitution:1];
        
        
        [self spawnCircles];
        
        [self activateJointRope];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (_myCircle1.physicsBody.dynamic) {
        
        [_myCircle1.physicsBody setDynamic:NO];
    }
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_myCircle1 setPosition:location];
        
        
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_myCircle1 setPosition:location];
        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_myCircle1.physicsBody.dynamic) {
        [_myCircle1.physicsBody setDynamic:YES];
    }
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_myCircle1.physicsBody.dynamic) {
        [_myCircle1.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
