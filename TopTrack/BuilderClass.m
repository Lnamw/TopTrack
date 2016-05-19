//
//  BuilderClass.m
//  TopTrack
//
//  Created by Elena Maso Willen on 19/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "BuilderClass.h"
#import "Artist.h"
#import "Track.h"

@implementation BuilderClass

- (Artist *)artistFromDictionary:(NSDictionary *)artistDict
{
    NSString *name = artistDict[@"name"];
    NSString *artistId = artistDict[@"id"];
    
    Artist *newArtist = [[Artist alloc] initWithName:name andID:artistId];
    return newArtist;
}

- (Track *)trackFromDictionary:(NSDictionary *)trackDict
{
    NSString *trackName = trackDict[@"name"];
    NSString *albumName = trackDict[@"album"][@"name"];
    
    NSArray *artists = trackDict[@"artists"];
    NSDictionary *artistDict = artists[0];
    NSString *artistName = artistDict[@"name"];
    
//    NSString *artistName = trackDict[@"artists"][@"name"];
    
    NSArray *images = trackDict[@"album"][@"images"];
    NSDictionary *imageDict = images[0];
    NSString *albumImage = imageDict[@"url"];
    
    Track *newTrack = [[Track alloc] initWithTrackName:trackName andAlbumName:albumName andArtistName:artistName andAlbumImage:albumImage];
    return newTrack;
}
    

@end
