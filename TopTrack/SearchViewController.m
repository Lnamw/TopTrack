//
//  SearchViewController.m
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "SearchViewController.h"
#import "Artist.h"

@interface SearchViewController () <UITextFieldDelegate>

@property (nonatomic, copy) NSString *artist;


@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)searchButtonPressed:(id)sender;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}


#pragma mark - TextField Delegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    
    [self.artistTextField resignFirstResponder];
    
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];

// Configure the cell...

//    return cell;
//}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


    
    
}

#pragma mark - Action Handler

- (IBAction)searchButtonPressed:(id)sender {
    
    self.artist = self.artistTextField.text;
    [self.delegate returnArtistTyped:self.artist];
    
}


@end








