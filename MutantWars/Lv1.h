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
int Points;
int MutantHit;

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
    IBOutlet UIButton *Left;
    IBOutlet UIButton *Right;
    
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
    
    IBOutlet UILabel *VicScore;
    IBOutlet UILabel *Score;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UILabel *WinOrLose;
    
    IBOutlet UIImageView *Radiation1;
    IBOutlet UIImageView *Radiation2;
    IBOutlet UIImageView *Radiation3;
    
    NSTimer *LeftTimer;
    NSTimer *RightTimer;
    NSTimer *MovementTimer;
    NSTimer *Timer;
}

@property(nonatomic, strong)UIImageView *Mutant1;
@property(nonatomic, strong)UIImageView *Mutant2;
@property(nonatomic, strong)UIImageView *Mutant3;
@property(nonatomic, strong)UIImageView *Mutant4;
@property(nonatomic, strong)UIImageView *Bullet;
@property(nonatomic, strong)UIImageView *Ship;
@property(nonatomic, strong)UIImageView *Radiation1;
@property(nonatomic, strong)UIImageView *Radiation2;
@property(nonatomic, strong)UIImageView *Radiation3;

@property(nonatomic, strong)AVAudioPlayer *MenuClick;
@property(nonatomic, strong)AVAudioPlayer *BoatGun;

-(IBAction)Shoot:(id)sender;
-(IBAction)Exit:(id)sender;
-(IBAction)Start:(id)sender;

-(IBAction)Left:(id)sender;
-(IBAction)StopLeft:(id)sender;
-(IBAction)Right:(id)sender;
-(IBAction)StopRight:(id)sender;

-(void)GoLeft;
-(void)GoRight;


-(void)MutantKilled;
-(void)Movement;
-(void)Collision;

-(void)Timer;


-(void)Win;
-(void)GameOver;


@end
