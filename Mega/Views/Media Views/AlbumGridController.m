//
//  AlbumGridController.m
//  Mega
//
//  Created by Sergey on 2/4/15.
//  Copyright (c) 2015 Sergey. All rights reserved.
//

#import "AlbumGridController.h"
#import "PlayerListController.h"
#import "Album.h"
#import "AlbumCell.h"

@interface AlbumGridController ()
{
    NSArray* albums;
    CGFloat cellHeight;
}
@end

@implementation AlbumGridController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cellHeight = 240;
    self.title = @"Albums";
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = UIColor.clearColor;
    
    self.layout.minimumInteritemSpacing = 0;
    self.layout.minimumLineSpacing = 0;
    
    CGFloat cellWidth = [self calcCellWidth:self.view.frame.size];
    self.layout.itemSize = CGSizeMake(cellWidth, cellHeight);
    
    
    Album* album1 = [[Album alloc] initWithTitle:@"Happiness" artist:@"Hurts" coverImageUrl:@"cover-album-1" songCount: 14];
    Album* album2 = [[Album alloc] initWithTitle:@"Exile" artist:@"Hurts" coverImageUrl:@"cover-album-2" songCount: 14];
    Album* album3 = [[Album alloc] initWithTitle:@"Ultraviolence" artist:@"Lana Del Rey" coverImageUrl:@"cover-album-3" songCount: 14];
    Album* album4 = [[Album alloc] initWithTitle:@"Science and Faith" artist:@"The Script" coverImageUrl:@"cover-album-4" songCount: 14];
    Album* album5 = [[Album alloc] initWithTitle:@"Gold Dust" artist:@"John Newman" coverImageUrl:@"cover-album-5" songCount: 14];
    Album* album6 = [[Album alloc] initWithTitle:@"Mylo Xyloto" artist:@"Coldplay" coverImageUrl:@"cover-album-6" songCount: 14];
    
    albums = @[album1, album2, album3, album4, album5, album6];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AlbumCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AlbumCell" forIndexPath: indexPath];
    
    Album* album = albums[indexPath.row];
    
    cell.titleLabel.text = album.title;
    cell.artistLabel.text = album.artist;
    cell.songCountLabel.text =  [NSString stringWithFormat:@" %d SONGS",album.songCount];
    cell.coverImageView.image = [UIImage imageNamed:album.coverImageUrl];
    
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return albums.count;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"detail"]){
        NSArray *selectedItems = self.collectionView.indexPathsForSelectedItems;
        NSIndexPath *selectedIndexPath = selectedItems[0];
        Album *album = (Album*)albums[selectedIndexPath.row];
        
        PlayerListController *controller = [segue destinationViewController];
        controller.album = album;
    }
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    CGFloat cellWidth = [self calcCellWidth:size];
    self.layout.itemSize = CGSizeMake(cellWidth, cellHeight);
}

-(CGFloat) calcCellWidth:(CGSize)size
{
    
    BOOL transitionToWide = size.width > size.height;
    
    CGFloat cellWidth = size.width / 2;
    
    if (transitionToWide) {
        
        cellWidth = size.width / 3;
    }
    
    return cellWidth;
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
