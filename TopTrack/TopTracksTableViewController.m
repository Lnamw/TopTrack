//
//  TopTracksTableViewController.m
//  TopTrack
//
//  Created by Elena Maso Willen on 19/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "TopTracksTableViewController.h"
#import "NetworkManager.h"
#import "TrackCell.h"
#import "BuilderClass.h"
#import "Track.h"

@interface TopTracksTableViewController ()

@property (nonatomic, strong) NSMutableArray *tracks;
@property (nonatomic, strong) NetworkManager *ntwMgr;

@end

@implementation TopTracksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tracks = [[NSMutableArray alloc] initWithCapacity:0];
    
    self.ntwMgr = [[NetworkManager alloc] init];
    [_ntwMgr getTopTracksWithId:self.selectedArtistId andCompletion:^(NSArray *artists, NSError *error) {
        
        BuilderClass *trackBuilder = [[BuilderClass alloc] init];
        
        for (NSDictionary *dict in artists) {
            Track *newTrack = [trackBuilder trackFromDictionary:dict];
            
            [self.tracks addObject:newTrack];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrackCell *cell = (TrackCell *)[tableView dequeueReusableCellWithIdentifier:@"TrackCell" forIndexPath:indexPath];
    
    Track *track = self.tracks[indexPath.row];
    cell.trackNameLabel.text = track.trackName;
    cell.albumNameLabel.text = track.albumName;
    cell.artistNameLabel.text = track.artistName;
    
    [self.ntwMgr getAlbumImagefromURL:[NSURL URLWithString:track.albumImage] completionBlock:^(UIImage *albumImage) {
        
        cell.albumImageView.image = albumImage;
    }];
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
