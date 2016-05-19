//
//  Artist.m
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "Artist.h"

@implementation Artist

-(instancetype)initWithName:(NSString *)name andID:(NSString *)artistID
{
    if (self = [super init]) {
        self.name = name;
        self.artistID = artistID;
    }
    return self;
}



@end
