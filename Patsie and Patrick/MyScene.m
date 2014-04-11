//
//  MyScene.m
//  Patsie and Patrick
//
//  Created by Jasmine Wright & Crystal Tong on 3/11/14.
//  Copyright (c) 2014 Jasmine Wright & Crystal Tong. All rights reserved.
//

#import "MyScene.h"

@interface MyScene()

@property SKSpriteNode* myCircle9;
@property SKSpriteNode* myCircle8;
@property SKSpriteNode* myCircle7;
@property SKSpriteNode* myCircle6;


@end



typedef NS_OPTIONS(uint32_t, CNPhysicsCategory)
{
    CNPhysicsCategoryPatsiePatric    = 1 << 0,  // 0001 = 1
    CNPhysicsCategoryPresent  = 1 << 1,  // 0010 = 2
    CNPhysicsCategoryBadPresent    = 1 << 2,  // 0100 = 4
    CNPhysicsCategoryBadPresent1    = 1 << 2,  // 0100 = 4
    CNPhysicsCategoryBadPresent2    = 1 << 2,  // 0100 = 4
    CNPhysicsCategoryEdge   = 1 << 3,  // 1000 = 8
    CNPhysicsCategoryLabel  = 1 << 4,  // 10000 = 16
};

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
    
    
    
}


-(instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size])
    {
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
        
        [_myCircle9 setPosition:CGPointMake(370, 350)];
        
        _myCircle9.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myCircle9.size];
        
        [_myCircle9.physicsBody setDynamic:YES];
        [self addChild:_myCircle9];
        self.physicsWorld.gravity = CGVectorMake(-0.5, -0.4);
        
        _myCircle8 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(20, 20)];
        
        [_myCircle8 setPosition:CGPointMake(550, 370)];
        
        _myCircle8.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myCircle8.size];
        
        [_myCircle8.physicsBody setDynamic:YES];
        [self addChild:_myCircle8];
        self.physicsWorld.gravity = CGVectorMake(-0.5, -0.4);
        
        _myCircle7 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(20, 20)];
        
        [_myCircle7 setPosition:CGPointMake(570, 470)];
        
        _myCircle7.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myCircle7.size];
        
        [_myCircle7.physicsBody setDynamic:YES];
        [self addChild:_myCircle7];
        self.physicsWorld.gravity = CGVectorMake(-0.5, -0.4);
    }
    return self;
}



- (void)initializeScene
{
    
    _gameNode = [SKNode node];
    [self addChild:_gameNode];
    
    _currentLevel = 1;
    [self setupLevel: _currentLevel];
    
}


- (void)setupLevel:(int)levelNum
{
    //    //load the plist file
    //    NSString *fileName =
    //    [NSString stringWithFormat:@"level%i",levelNum];
    //    NSString *filePath =
    //    [[NSBundle mainBundle] pathForResource:fileName
    //                                    ofType:@"plist"];
    //    NSDictionary *level =
    //    [NSDictionary dictionaryWithContentsOfFile:filePath];
    //
    //    [self addCatAtPosition:
    //     CGPointFromString(level[@"catPosition"])];
    //    [self addBlocksFromArray:level[@"blocks"]];
    //
    //    [[SKTAudio sharedInstance] playBackgroundMusic:@"bgMusic.mp3"];
}

- (void)spawnPresents
{
    SKSpriteNode *present =
    [SKSpriteNode spriteNodeWithImageNamed:@"present"];
    present.position = CGPointMake(
                                   (float)(arc4random()%(int)self.size.width),
                                   self.size.height - present.size.height);
    present.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:present.size.width/2];
    present.name = @"present";
    [self addChild:present];
    
    present.physicsBody.restitution = 1.0;
    present.physicsBody.density = 20.0;
    
    SKSpriteNode *badPresent =
    [SKSpriteNode spriteNodeWithImageNamed:@"Bad present"];
    badPresent.position = CGPointMake(
                                      (float)(arc4random()%(int)self.size.width),
                                      self.size.height - badPresent.size.height);
    badPresent.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:badPresent.size.width/2];
    badPresent.name = @"Bad present";
    [self addChild:badPresent];
    
    badPresent.physicsBody.restitution = 1.0;
    badPresent.physicsBody.density = 20.0;
    
    SKSpriteNode *badPresentRight =
    [SKSpriteNode spriteNodeWithImageNamed:@"Bad present Right"];
    badPresentRight.position = CGPointMake(
                                           (float)(arc4random()%(int)self.size.width),
                                           self.size.height - badPresentRight.size.height);
    badPresentRight.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:badPresentRight.size.width/2];
    badPresentRight.name = @"bad Present Right";
    [self addChild:badPresentRight];
    
    badPresentRight.physicsBody.restitution = 1.0;
    badPresentRight.physicsBody.density = 20.0;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event

{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (_myCircle9.position.x < location.x + 50 && _myCircle9.position.x > location.x - 50 &&
            
            _myCircle9.position.y < location.y + 50 && _myCircle9.position.y > location.y - 50) {
            
            _myCircle9.position = CGPointMake(400, 400);
        }//CG
    }//for
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (_myCircle9.position.x < location.x + 50 && _myCircle9.position.x > location.x - 50 &&
            
            _myCircle9.position.y < location.y + 50 && _myCircle9.position.y > location.y - 50) {
            
            _myCircle9.position = CGPointMake(200, 400);
            
        }//for2
    }//CG2
    
    
    
    
    
}//TB


- (void)inGameMessage:(NSString*)text
{
    // 1
    SKLabelNode *label =
    [SKLabelNode labelNodeWithFontNamed:@"Desdemona"];
    label.text = text;
    label.fontSize = 64.0;
    label.color = [SKColor whiteColor];
    
    // 2
    label.position = CGPointMake(self.frame.size.width/2,
                                 self.frame.size.height-10);
    label.physicsBody =
    [SKPhysicsBody bodyWithCircleOfRadius:10];
    label.physicsBody.collisionBitMask = CNPhysicsCategoryEdge;
    label.physicsBody.categoryBitMask = CNPhysicsCategoryLabel;
    label.physicsBody.restitution = 0.7;
    
    // 3
    [_gameNode addChild:label];
    
    // 4
    [label runAction:
     [SKAction sequence:@[
                          [SKAction waitForDuration:3.0],
                          [SKAction removeFromParent]]]];
}
- (void)newGame
{
    [_gameNode removeAllChildren];
    [self setupLevel: _currentLevel];
    [self inGameMessage:[NSString stringWithFormat:
                         @"Level %i", _currentLevel]];
}

- (void)win
{
    // 1
    _l1patsiepatrick.physicsBody=nil;
    
    // 2
    CGFloat curlY = _badpresent1.position.y+_l1patsiepatrick.size.height/2;
    CGPoint curlPoint = CGPointMake(_badpresent1.position.x, curlY);
    
    // 3
    [_l1patsiepatrick runAction:
     [SKAction group:
      @[[SKAction moveTo:curlPoint duration:0.66],
        [SKAction rotateToAngle:0 duration:0.5]]]];
    
    [self inGameMessage:@"NOMMMMM!"];
    
    // 4
    [self runAction:
     [SKAction sequence:
      @[[SKAction waitForDuration:5.0],
        [SKAction performSelector:@selector(newGame)
                         onTarget:self]]]];
    
    // 5
    [_l1patsiepatrick runAction:
     [SKAction animateWithTextures:
      @[[SKTexture textureWithImageNamed:@"L1Annoyed"],
        [SKTexture textureWithImageNamed:@"L1Mad"],
        [SKTexture textureWithImageNamed:@"L1Angry"]]
                      timePerFrame:0.25]];
    
    // 6
    //    [[SKTAudio sharedInstance] pauseBackgroundMusic];
    //    [self runAction:[SKAction playSoundFileNamed:@"win.mp3"
    //                               waitForCompletion:NO]];
}


@end
