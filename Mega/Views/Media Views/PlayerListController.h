//
//  PlayerListController.h
//  Mega
//
//  Created by Sergey on 11/03/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackCell.h"
#import "Album.h"
#import "Track.h"

#import <AVFoundation/AVAudioPlayer.h>

@interface PlayerListController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    AVAudioPlayer *player;
    NSTimer *timer;
    BOOL isPaused;
}

@property (retain, nonatomic) Album *album;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;

@property (weak, nonatomic) IBOutlet UILabel *trackStartLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackEndLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *trackProgress;

@property (weak, nonatomic) IBOutlet UIButton *mediaPlayButton;
@property (weak, nonatomic) IBOutlet UIButton *mediaShuffleButton;
@property (weak, nonatomic) IBOutlet UIButton *mediaRewindButton;
@property (weak, nonatomic) IBOutlet UIButton *mediaForwardButton;
@property (weak, nonatomic) IBOutlet UIButton *mediaRepeatButton;

@property (weak, nonatomic) IBOutlet UITableView *trackTableView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;

@end
