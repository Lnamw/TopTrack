//
//  BuilderClass.h
//  TopTrack
//
//  Created by Elena Maso Willen on 19/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Artist;
@class Track;

@interface BuilderClass : NSObject

- (Artist *)artistFromDictionary:(NSDictionary *)artistDict;

- (Track *)trackFromDictionary:(NSDictionary *)trackDict;

@end
