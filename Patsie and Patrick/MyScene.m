//
//  MyScene.m
//  Patsie and Patrick
//
//  Created by Jasmine Wright & Crystal Tong on 3/11/14.
//  Copyright (c) 2014 Jasmine Wright & Crystal Tong. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }
    return self;
}
-(void) activateJointRope{
    
    _myRopeJoint = [SKPhysicsJointLimit jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare2.physicsBody anchorA:_mySquare1.position anchorB:_mySquare2.position];
    
    [self.physicsWorld addJoint:_myRopeJoint];
    
    _myRopeJoint1 = [SKPhysicsJointLimit jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare3.physicsBody anchorA:_mySquare2.position anchorB:_mySquare3.position];
    
    [self.physicsWorld addJoint:_myRopeJoint1];
    
    
    _myRopeJoint2 = [SKPhysicsJointLimit jointWithBodyA:_mySquare3.physicsBody bodyB:_mySquare4.physicsBody anchorA:_mySquare3.position anchorB:_mySquare4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint2];
    
    _myRopeJoint3 = [SKPhysicsJointLimit jointWithBodyA:_mySquare4.physicsBody bodyB:_mySquare5.physicsBody anchorA:_mySquare4.position anchorB:_mySquare5.position];
    
    [self.physicsWorld addJoint:_myRopeJoint3];
    
    _myRopeJoint4 = [SKPhysicsJointLimit jointWithBodyA:_mySquare5.physicsBody bodyB:_mySquare6.physicsBody anchorA:_mySquare5.position anchorB:_mySquare6.position];
    
    [self.physicsWorld addJoint:_myRopeJoint4];
    
    _myRopeJoint5 = [SKPhysicsJointSpring jointWithBodyA:_mySquare6.physicsBody bodyB:_mySquare7.physicsBody anchorA:_mySquare6.position anchorB:_mySquare7.position];
    
    [self.physicsWorld addJoint:_myRopeJoint5];
    
    _myRopeJoint6 = [SKPhysicsJointLimit jointWithBodyA:_mySquare7.physicsBody bodyB:_mySquare8.physicsBody anchorA:_mySquare7.position anchorB:_mySquare8.position];
    
    [self.physicsWorld addJoint:_myRopeJoint6];
    
}
-(void) spawnSquares{
    
    [_mySquare1 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_mySquare2 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2)];
    [_mySquare3 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2.5)];
    [_mySquare4 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3)];
    [_mySquare5 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3.5)];
    [_mySquare6 setPosition:CGPointMake(self.size.width/1.5, self.size.height/4)];
    [_mySquare7 setPosition:CGPointMake(self.size.width/1.5, self.size.height/4.5)];
    [_mySquare8 setPosition:CGPointMake(self.size.width/1.5, self.size.height/5)];
    
    
    [_mySquare1.physicsBody setRestitution:1.0];
    [_mySquare2.physicsBody setRestitution:1.0];
    [_mySquare3.physicsBody setRestitution:1.0];
    [_mySquare4.physicsBody setRestitution:1.0];
    [_mySquare5.physicsBody setRestitution:1.0];
    [_mySquare6.physicsBody setRestitution:1.0];
    [_mySquare7.physicsBody setRestitution:1.0];
    [_mySquare8.physicsBody setRestitution:1.0];
    
    [self addChild:_mySquare1];
    [self addChild:_mySquare2];
    [self addChild:_mySquare3];
    [self addChild:_mySquare4];
    [self addChild:_mySquare5];
    [self addChild:_mySquare6];
    [self addChild:_mySquare7];
    [self addChild:_mySquare8];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
