//
//  Lv1.h
//  MutantWars
//
//  Created by Devon on 9/7/13.
//  Copyright (c) 2013 Devon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"
#import "ViewController.h"

int BulletMovement;
int BulletsOnScreen;
int Bullet;
int MutantMovement;
int RadiationStart;
int MutantStart;
int ShipMovement;
int MutantKilled;
int GameTimer;

BOOL FullHealth;
BOOL ThreeQuartHealth;
BOOL HalfHealth;
BOOL QuarterHealth;
BOOL EmptyHealth;


@interface Lv1 : UIViewController{
    
    IBOutlet AVAudioPlayer *MenuClick;
    IBOutlet AVAudioPlayer *BoatGun;
    
    IBOutlet UIButton *Shoot;
    IBOutlet UIButton *Exit;
    IBOutlet UIButton *Start;
    
    IBOutlet UIImageView *Ship;
    IBOutlet UIImageView *Bullet;
    
    IBOutlet UIImageView *Mutant1;
    IBOutlet UIImageView *Mutant2;
    IBOutlet UIImageView *Mutant3;
    IBOutlet UIImageView *Mutant4;
    
    IBOutlet UIImageView *FullHealth;
    IBOutlet UIImageView *ThreeQuartHealth;
    IBOutlet UIImageView *HalfHealth;
    IBOutlet UIImageView *QuarterHealth;
    IBOutlet UIImageView *EmptyHealth;
    
    IBOutlet UILabel *CountDown;
    
    
    IBOutlet UILabel *Score;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *WinOrLose;
    
    IBOutlet UIImageView *Radiation1;
    IBOutlet UIImageView *Radiation2;
    IBOutlet UIImageView *Radiation3;
    
    NSTimer *MovementTimer;
    NSTimer *Timer;
}

@property(nonatomic, retain)UIImageView *Mutant1;
@property(nonatomic, retain)UIImageView *Mutant2;
@property(nonatomic, retain)UIImageView *Mutant3;
@property(nonatomic, retain)UIImageView *Mutant4;
@property(nonatomic, retain)UIImageView *Bullet;
@property(nonatomic, retain)UIImageView *Ship;
@property(nonatomic, retain)UIImageView *Radiation1;
@property(nonatomic, retain)UIImageView *Radiation2;
@property(nonatomic, retain)UIImageView *Radiation3;

@property(nonatomic, retain)AVAudioPlayer *MenuClick;
@property(nonatomic, retain)AVAudioPlayer *BoatGun;

-(IBAction)Shoot:(id)sender;
-(IBAction)Exit:(id)sender;
-(IBAction)Start:(id)sender;

-(void)MutantKilled;
-(void)Movement;
-(void)Collision;

-(void)Timer;

-(void)GameOver;


@end
