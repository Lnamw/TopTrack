//
//  NetworkManager.m
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "NetworkManager.h"
#import "SearchViewController.h"

@interface NetworkManager ()

@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfig;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NetworkManager

-(void)getArtistWithArtistName:(NSString *)artistName andCompletion:(completionBlock)completionHandler
{
    NSString *artistNameForUrl = [artistName stringByReplacingOccurrencesOfString:@" " withString:@"+"];

    NSString *urlString = [NSString stringWithFormat:@"https://api.spotify.com/v1/search?q=%@&type=artist", artistNameForUrl];
    NSURL *url = [NSURL URLWithString:urlString];
    
    self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    
    NSURLSessionDataTask *artistJSON = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //TODO handle error
        } else {
            
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            NSArray *artistArray = jsonDict[@"artists"][@"items"];
            completionHandler(artistArray, error);
        }
    }];
    [artistJSON resume];
}

-(void)getTopTracksWithId:(NSString *)artistId andCompletion:(completionBlock)completionHandler
{
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.spotify.com/v1/artists/%@/top-tracks?country=GB", artistId];
    NSURL *url = [NSURL URLWithString:urlString];
    
    self.sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:self.sessionConfig];
    
    NSURLSessionDataTask *trackJSON = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //TODO handle error
        } else {
            
            NSError *jsonError;
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            NSArray *trackArray = jsonDict[@"tracks"];
            completionHandler(trackArray, error);
        }
    }];
    [trackJSON resume];
}


- (void)getAlbumImagefromURL:(NSURL *)url completionBlock:(downloadCompletionBlock)completionBlock
{
    NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completionBlock) {
                completionBlock(downloadedImage);
            }
        });
    }];
    
    [downloadTask resume];
}





@end





