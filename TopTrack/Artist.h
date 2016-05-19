//
//  Artist.h
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artistID;

-(instancetype)initWithName:(NSString *)name andID:(NSString *)artistID;

@end
