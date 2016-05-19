//
//  NetworkManager.m
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager ()

@property (nonatomic, strong) NSString *artist;
@property (nonatomic, strong) completionBlock completionHandler;
@property (nonatomic, strong) NSMutableArray *albums;

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetworkManager

-(void)getTracksWithCompletion:(completionBlock)completionHandler
{
//    
//    self.completionHandler = completionHandler;
//    
//    self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
//    //    No need headers so we can setup without any other configuration (see in postman)
//    
//    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
//    
//    __weak typeof (self) weakself = self;
//    
//    NSURLSessionDataTask *albumJSON = [self.session dataTaskWithURL:[NSURL URLWithString:kURL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        if (error) {
//            //TODO handle error
//        } else {
//            
//            NSError *jsonError;
//            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
//            
//            NSArray *albums = jsonDict[@"items"];
//            
//            [weakself getAlbumDataForAlbums:albums];
//            
//        }
//    }];
//    
//    
//    [albumJSON resume];
}


#pragma mark - SearchViewController Delegate

-(void)returnArtistTyped:(NSString *)artist {

    SearchViewController *searchVC = [[SearchViewController alloc] init];
    searchVC.delegate = self;
    
    self.artist = artist;
    
    NSLog(@"%@", artist);
}


@end
