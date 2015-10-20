//
//  PlayerListController.m
//  Mega
//
//  Created by Sergey on 11/03/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "PlayerListController.h"
#import "MegaTheme.h"

@interface PlayerListController ()

@end

@implementation PlayerListController

@synthesize album;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isPaused = true;
    if (album == nil) {
        self.album = [[Album alloc]initWithTitle:@"Wonderful Life" artist:@"Hurts" coverImageUrl:@"cover-album-4" songCount: 5];
    }
    
    Track *track1 = [[Track alloc]initWithTitle:@"You Won't Feel a Thing" duration:@"2:30" filename:@"sample-track-1"];
    Track *track2 = [[Track alloc]initWithTitle:@"For the First Time" duration:@"4:20" filename:@"sample-track-2"];
    Track *track3 = [[Track alloc]initWithTitle:@"Nothing" duration:@"3:45" filename:@"sample-track-1"];
    Track *track4 = [[Track alloc]initWithTitle:@"Science & Faith" duration:@"5:01" filename:@"sample-track-2"];
    Track *track5 = [[Track alloc]initWithTitle:@"If You Ever Come Back" duration:@"4:49" filename:@"sample-track-1"];
    
    album.tracks = [[NSMutableArray alloc] initWithArray:@[track1, track2, track3, track4, track5]];
    
    self.coverImageView.image = [UIImage imageNamed:album.coverImageUrl];
    self.bgImageView.image = [UIImage imageNamed:album.coverImageUrl];
    
    self.titleLabel.text = album.title;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size:18];
    
    self.artistLabel.text = album.artist;
    self.artistLabel.textColor = [UIColor whiteColor];
    self.artistLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size:13];
    
    self.trackStartLabel.text = @"- : --";
    self.trackStartLabel.textColor = [UIColor whiteColor];
    self.trackStartLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size:11];
    
    self.trackEndLabel.text = @"- : --";
    self.trackEndLabel.textColor = [UIColor whiteColor];
    self.trackEndLabel.font = [UIFont fontWithName:MegaTheme.semiBoldFontName size:11];
    
    self.trackProgress.tintColor = [UIColor colorWithRed:0.16 green:0.75 blue:0.56 alpha:1.0];
    
    UIImage *backImage = [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.backButton setImage:backImage forState:UIControlStateNormal];
    [self.backButton setTitle:@"" forState:UIControlStateNormal];
    [self.backButton setTintColor:[UIColor whiteColor]];
    [self.backButton addTarget:self action:@selector(backButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self themeMediaButton:self.mediaRepeatButton imageName:@"media-repeat"];
    [self themeMediaButton:self.mediaPlayButton imageName:@"media-play"];
    [self themeMediaButton:self.mediaRewindButton imageName:@"media-rewind"];
    [self themeMediaButton:self.mediaForwardButton imageName:@"media-forward"];
    [self themeMediaButton:self.mediaShuffleButton imageName:@"media-shuffle"];
    
    self.trackTableView.delegate = self;
    self.trackTableView.dataSource = self;
    self.trackTableView.backgroundColor = [UIColor clearColor];
    self.trackTableView.separatorColor = [UIColor colorWithWhite:1.0 alpha:0.4];
    
    [self.mediaPlayButton addTarget:self action:@selector(playButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *soundFilePath = [[NSBundle mainBundle]pathForResource:@"sample-track-1" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc]initFileURLWithPath:soundFilePath];
    NSError *error;
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    
    self.trackProgress.progress = 0.0f;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backButtonTapped:(UIButton *)sender
{
    [player stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)themeMediaButton:(UIButton *)button imageName:(NSString *)imageName
{
    button.tintColor = [UIColor whiteColor];
    [button setTintColor:[UIColor whiteColor]];
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [button setImage:image forState:UIControlStateNormal];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TrackCell"];
    
    Track *track = album.tracks[indexPath.row];
    cell.nameLabel.text = track.name;
    cell.durationLabel.text = track.duration;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return album.tracks.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self playTrackAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (void)playTrackAtIndexPath:(NSIndexPath *)indexPath
{
    Track *track = album.tracks[indexPath.row];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:track.filename ofType: @"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:soundFilePath];
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    isPaused = true;
    [self playButtonTapped];
    
    [self updateTime];
}

- (void) playButtonTapped
{
    if (isPaused) {
        [player play];
        [self scheduleTimer];
        [self themeMediaButton:self.mediaPlayButton imageName:@"media-pause"];
        isPaused = false;
    } else {
        [player pause];
        [self themeMediaButton:self.mediaPlayButton imageName:@"media-play"];
        isPaused = true;
    }
}

- (void) updateTime
{
    self.trackStartLabel.text = [self timeFormat:[player currentTime]];
    self.trackEndLabel.text = [self timeFormat:[player duration] - [player currentTime]];
    
    float progress = [player currentTime] / [player duration];
    
    self.trackProgress.progress = progress;
}

- (void) scheduleTimer
{
    if (timer != nil) {
        [timer invalidate];
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:true];
}

- (NSString *)timeFormat:(NSTimeInterval)value
{
    double round = (double)(lround(value))/60;
    double minutes = floor(round);
    double seconds = (double)(lround(value)) - (minutes * 60);
    
    int roundedSeconds = (int)lround(seconds);
    int roundedMinutes = (int)lround(minutes);
    
    NSString *time = [NSString stringWithFormat:@"%d:%02d", roundedMinutes, roundedSeconds];
    
    return time;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    CGFloat transitionToWide = size.width > size.height;
    self.imageHeightConstraint.constant = transitionToWide ? 0 : 200;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
