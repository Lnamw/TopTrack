//
//  Track.m
//  TopTrack
//
//  Created by Elena Maso Willen on 19/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "Track.h"

@implementation Track

-(instancetype)initWithTrackName:(NSString *)trackName andAlbumName:(NSString *)albumName andArtistName:(NSString *)artistName andAlbumImage:(NSString *)albumImage
{
    if (self = [super init]) {
        self.trackName = trackName;
        self.albumName = albumName;
        self.artistName = artistName;
        self.albumImage = albumImage;
    }
    return self;
}

@end
