//
//  SearchViewController.m
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "SearchViewController.h"
#import "Artist.h"
#import "NetworkManager.h"
#import "BuilderClass.h"
#import "ArtistCell.h"
#import "TopTracksTableViewController.h"


@interface SearchViewController () <UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *artistList;

@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.artistList = [[NSMutableArray alloc] initWithCapacity:0];

}


#pragma mark - TextField Delegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    if (![textField.text isEqualToString:@""]) {
        
        [self.artistTextField resignFirstResponder];
        
        NetworkManager *netMgr = [[NetworkManager alloc]init];
        
        [netMgr getArtistWithArtistName:textField.text andCompletion:^(NSArray *artists, NSError *error) {
            if(!error)
            {
                BuilderClass *artistBuilder = [[BuilderClass alloc]init];
                for (NSDictionary *dict in artists)
                {
                    Artist *newArtist = [artistBuilder artistFromDictionary:dict];
                    
                    [self.artistList addObject:newArtist];
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.tableView reloadData];
                    });
                }
            }
        }];
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.artistList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArtistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArtistCell" forIndexPath:indexPath];

    Artist *artist = self.artistList[indexPath.row];
    cell.textLabel.text = artist.name;
    return cell;
}

#pragma mark - Table View Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"ShowTopTracksSegue" sender:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ShowTopTracksSegue"]) {
        
        TopTracksTableViewController *vc = (TopTracksTableViewController *)[segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Artist *artist = self.artistList[indexPath.row];
        vc.selectedArtistId = artist.artistID;
        
    }

    
    
}




@end








