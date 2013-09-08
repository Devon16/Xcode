//
//  Lv1.m
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import "Lv1.h"

@interface Lv1 ()

@end

@implementation Lv1

@synthesize Mutant1, Mutant2, Mutant3, Mutant4, Ship, Bullet, MenuClick, Radiation1, Radiation2, Radiation3, BoatGun;


-(void)GameOver{
    WinOrLose.hidden = NO;
    WinOrLose.text = [NSString stringWithFormat:@"You Have Died"];
    Mutant1.hidden = YES;
    Mutant2.hidden = YES;
    Mutant3.hidden = YES;
    Mutant4.hidden = YES;
    Bullet.hidden = YES;
    EmptyHealth.hidden = YES;
    Ship.hidden = YES;
    Radiation1.hidden = YES;
    Radiation2.hidden = YES;
    Radiation3.hidden = YES;
    Shoot.hidden = YES;
    Exit.hidden = NO;
    Start.hidden = YES;
    
    CountDown.hidden = YES;
    
    [MovementTimer invalidate];
    [Timer invalidate];
}

-(void)CountDown{
    GameTimer -= 1;
    CountDown.text = [NSString stringWithFormat:@"%i", GameTimer];
}

-(IBAction)Start:(id)sender{
    [MenuClick play];

    CountDown.hidden = NO;
    Shoot.hidden = NO;
    Start.hidden = YES;
    Exit.hidden =YES;
    Mutant1.hidden = NO;
    Mutant2.hidden = NO;
    Mutant3.hidden = NO;
    Mutant4.hidden = NO;

    ScoreLabel.hidden = NO;
    Score.hidden = NO;
    Ship.hidden = NO;
    Bullet.hidden = YES;
    Radiation1.hidden = NO;
    Radiation2.hidden = NO;
    Radiation3.hidden = NO;
    
    FullHealth.hidden =NO;
    ThreeQuartHealth.hidden = YES;
    HalfHealth.hidden = YES;
    QuarterHealth.hidden = YES;
    EmptyHealth.hidden = YES;
    
    GameTimer = 120;
    Timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
    
    MovementTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(Movement) userInfo:nil repeats:YES];
    
    RadiationStart = arc4random() %315;
    Radiation1.center = CGPointMake(RadiationStart, 0);
    
    RadiationStart = arc4random() %315;
    Radiation2.center = CGPointMake(RadiationStart, -150);
    
    RadiationStart = arc4random() %315;
    Radiation3.center = CGPointMake(RadiationStart, -300);

}

-(void)Movement{
    Ship.center = CGPointMake(Ship.center.x + ShipMovement, Ship.center.y);
    Bullet.center = CGPointMake(Bullet.center.x, Bullet.center.y - BulletMovement);
    Mutant1.center = CGPointMake(Mutant1.center.x, Mutant1.center.y + 5);
    Mutant2.center = CGPointMake(Mutant2.center.x, Mutant2.center.y + 5);
    Mutant3.center = CGPointMake(Mutant3.center.x, Mutant3.center.y + 5);
    Mutant4.center = CGPointMake(Mutant4.center.x, Mutant4.center.y + 5);

    Radiation1.center = CGPointMake(Radiation1.center.x, Radiation1.center.y + 5);
    Radiation2.center = CGPointMake(Radiation2.center.x, Radiation2.center.y + 5);
    Radiation3.center = CGPointMake(Radiation3.center.x, Radiation3.center.y + 5);
    
    //Radiaton Movements
    if (Radiation1.center.y > 470) {
        RadiationStart = arc4random() %315;
        Radiation1.center = CGPointMake(RadiationStart, 0);
    }
    if (Radiation2.center.y > 470) {
        RadiationStart = arc4random() %315;
        Radiation2.center = CGPointMake(RadiationStart, 0);
    }
    if (Radiation3.center.y > 470) {
        RadiationStart = arc4random() %315;
        Radiation3.center = CGPointMake(RadiationStart, 0);
    }
    //mutant movements
    if (Mutant1.center.y > 470) {
        MutantStart = arc4random() %315;
        Mutant1.center = CGPointMake(MutantStart, 0);
    }
    if (Mutant2.center.y > 470) {
        MutantStart = arc4random() %315;
        Mutant2.center = CGPointMake(MutantStart, 0);
    }
    if (Mutant4.center.y > 470) {
        MutantStart = arc4random() %315;
        Mutant4.center = CGPointMake(MutantStart, 0);
    }
    if (Mutant4.center.y > 470) {
        MutantStart = arc4random() %315;
        Mutant4.center = CGPointMake(MutantStart, 0);
    }

    
    [self Collision];
    
    if (Bullet.center.y < 0) {
        Bullet.hidden = YES;
        BulletsOnScreen = 0;
        BulletMovement = 0;
    }
    

}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    if (point.x < 160) {
        ShipMovement = -7;
    }
    else{
        ShipMovement = 7;
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    ShipMovement = 0;
}

-(IBAction)Shoot:(id)sender{
    [BoatGun play];
    if (BulletsOnScreen == 0) {
        Bullet.hidden = NO;
        Bullet.center = CGPointMake(Ship.center.x, 352);
        BulletsOnScreen = BulletsOnScreen + 1;
        BulletMovement = 7;
    }
}


-(IBAction)Exit:(id)sender{
    [MenuClick play];
    ViewController *GameToMenu = [[ViewController alloc]
                                  initWithNibName:@"ViewController"
                                  bundle:nil];
    
    [self.view addSubview:GameToMenu.view];
}

-(void)MutantKilled{
    MutantKilled = MutantKilled + 1;
    BulletsOnScreen = BulletsOnScreen -1;
    Bullet.hidden = YES;
    BulletMovement = 0;
    Bullet.center = CGPointMake(160, 389);
    
}


-(void)Collision{
    
    //Radiation Collisions
    if((CGRectIntersectsRect(Radiation1.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Radiation1.hidden = YES;
        RadiationStart = arc4random() %315;
        Radiation1.center = CGPointMake(RadiationStart, 20);
        Radiation1.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Radiation1.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Radiation1.hidden = YES;
            RadiationStart = arc4random() %315;
            Radiation1.center = CGPointMake(RadiationStart, 20);
            Radiation1.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Radiation1.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Radiation1.hidden = YES;
                RadiationStart = arc4random() %315;
                Radiation1.center = CGPointMake(RadiationStart, 20);
                Radiation1.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Radiation1.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Radiation1.hidden = YES;
                    RadiationStart = arc4random() %315;
                    Radiation1.center = CGPointMake(RadiationStart, 20);
                    Radiation1.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    if((CGRectIntersectsRect(Radiation2.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Radiation2.hidden = YES;
        RadiationStart = arc4random() %315;
        Radiation2.center = CGPointMake(RadiationStart, 20);
        Radiation2.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Radiation2.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Radiation2.hidden = YES;
            RadiationStart = arc4random() %315;
            Radiation2.center = CGPointMake(RadiationStart, 20);
            Radiation2.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Radiation2.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Radiation2.hidden = YES;
                RadiationStart = arc4random() %315;
                Radiation2.center = CGPointMake(RadiationStart, 20);
                Radiation2.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Radiation2.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Radiation2.hidden = YES;
                    RadiationStart = arc4random() %315;
                    Radiation2.center = CGPointMake(RadiationStart, 20);
                    Radiation2.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    if((CGRectIntersectsRect(Radiation3.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Radiation3.hidden = YES;
        RadiationStart = arc4random() %315;
        Radiation3.center = CGPointMake(RadiationStart, 20);
        Radiation3.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Radiation3.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Radiation3.hidden = YES;
            RadiationStart = arc4random() %315;
            Radiation3.center = CGPointMake(RadiationStart, 20);
            Radiation3.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Radiation3.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Radiation3.hidden = YES;
                RadiationStart = arc4random() %315;
                Radiation3.center = CGPointMake(RadiationStart, 20);
                Radiation3.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Radiation3.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Radiation3.hidden = YES;
                    RadiationStart = arc4random() %315;
                    Radiation3.center = CGPointMake(RadiationStart, 20);
                    Radiation3.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    //Mutant Collisions
    if((CGRectIntersectsRect(Mutant1.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Mutant1.hidden = YES;
        MutantStart = arc4random() %315;
        Mutant1.center = CGPointMake(MutantStart, 20);
        Mutant1.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Mutant1.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Mutant1.hidden = YES;
            MutantStart = arc4random() %315;
            Mutant1.center = CGPointMake(MutantStart, 20);
            Mutant1.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Mutant1.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Mutant1.hidden = YES;
                MutantStart = arc4random() %315;
                Mutant1.center = CGPointMake(MutantStart, 20);
                Mutant1.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Mutant1.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Mutant1.hidden = YES;
                    MutantStart = arc4random() %315;
                    Mutant1.center = CGPointMake(MutantStart, 20);
                    Mutant1.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    if((CGRectIntersectsRect(Mutant2.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Mutant2.hidden = YES;
        MutantStart = arc4random() %315;
        Mutant2.center = CGPointMake(MutantStart, 20);
        Mutant2.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Mutant2.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Mutant2.hidden = YES;
            MutantStart = arc4random() %315;
            Mutant2.center = CGPointMake(MutantStart, 20);
            Mutant2.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Mutant2.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Mutant2.hidden = YES;
                MutantStart = arc4random() %315;
                Mutant2.center = CGPointMake(MutantStart, 20);
                Mutant2.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Mutant2.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Mutant2.hidden = YES;
                    MutantStart = arc4random() %315;
                    Mutant2.center = CGPointMake(MutantStart, 20);
                    Mutant2.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    if((CGRectIntersectsRect(Mutant3.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Mutant3.hidden = YES;
        MutantStart = arc4random() %315;
        Mutant3.center = CGPointMake(MutantStart, 20);
        Mutant3.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Mutant3.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Mutant3.hidden = YES;
            MutantStart = arc4random() %315;
            Mutant3.center = CGPointMake(MutantStart, 20);
            Mutant3.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Mutant3.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Mutant3.hidden = YES;
                MutantStart = arc4random() %315;
                Mutant3.center = CGPointMake(MutantStart, 20);
                Mutant3.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Mutant3.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Mutant3.hidden = YES;
                    MutantStart = arc4random() %315;
                    Mutant3.center = CGPointMake(MutantStart, 20);
                    Mutant3.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
    if((CGRectIntersectsRect(Mutant4.frame, Ship.frame) && FullHealth.hidden == NO)) {
        FullHealth.hidden = YES;
        ThreeQuartHealth.hidden = NO;
        Mutant4.hidden = YES;
        MutantStart = arc4random() %315;
        Mutant4.center = CGPointMake(MutantStart, 20);
        Mutant4.hidden = NO;
    }
    else{
        if((CGRectIntersectsRect(Mutant4.frame, Ship.frame) && ThreeQuartHealth.hidden == NO)) {
            ThreeQuartHealth.hidden = YES;
            HalfHealth.hidden = NO;
            Mutant4.hidden = YES;
            MutantStart = arc4random() %315;
            Mutant4.center = CGPointMake(MutantStart, 20);
            Mutant4.hidden = NO;
        }
        else{
            if((CGRectIntersectsRect(Mutant4.frame, Ship.frame)  && HalfHealth.hidden == NO)) {
                HalfHealth.hidden = YES;
                QuarterHealth.hidden = NO;
                Mutant4.hidden = YES;
                MutantStart = arc4random() %315;
                Mutant4.center = CGPointMake(MutantStart, 20);
                Mutant4.hidden = NO;
            }
            else{
                if((CGRectIntersectsRect(Mutant4.frame, Ship.frame)  && QuarterHealth.hidden == NO)) {
                    QuarterHealth.hidden = YES;
                    EmptyHealth.hidden = NO;
                    Mutant4.hidden = YES;
                    MutantStart = arc4random() %315;
                    Mutant4.center = CGPointMake(MutantStart, 20);
                    Mutant4.hidden = NO;
                }
                if (EmptyHealth.hidden == NO) {
                    [self GameOver];
                }
            }
        }
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    AVAudioPlayer *pp1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"MenuClick" ofType:@"mp3"]] error:nil];
    self.MenuClick = pp1;
    [pp1 prepareToPlay];
    [pp1 release];
    
    AVAudioPlayer *pp2 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"BoatGun" ofType:@"mp3"]] error:nil];
    self.BoatGun = pp2;
    [pp2 prepareToPlay];
    [pp2 release];
    
    Bullet.hidden = YES;
    Ship.hidden = YES;
    Mutant1.hidden = YES;
    Mutant2.hidden = YES;
    Mutant3.hidden = YES;
    Mutant4.hidden = YES;
    Shoot.hidden = YES;
    Radiation1.hidden = YES;
    Radiation2.hidden = YES;
    Radiation3.hidden = YES;
    
    CountDown.hidden = YES;
    
    FullHealth.hidden = YES;
    ThreeQuartHealth.hidden = YES;
    HalfHealth.hidden = YES;
    QuarterHealth.hidden = YES;
    EmptyHealth.hidden = YES;
    
    Score.hidden = YES;
    ScoreLabel.hidden = YES;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    @end
