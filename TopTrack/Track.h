//
//  Track.h
//  TopTrack
//
//  Created by Elena Maso Willen on 19/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Track : NSObject

@property (nonatomic, copy) NSString *trackName;
@property (nonatomic, copy) NSString *albumName;
@property (nonatomic, copy) NSString *artistName;
@property (nonatomic, copy) NSString *albumImage;

-(instancetype)initWithTrackName:(NSString *)trackName andAlbumName:(NSString *)albumName andArtistName:(NSString *)artistName andAlbumImage:(NSString *)albumImage;

@end
