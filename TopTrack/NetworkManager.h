//
//  NetworkManager.h
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkManager : NSObject 

typedef void(^completionBlock)(NSArray *artists, NSError *error);
typedef void(^downloadCompletionBlock) (UIImage *albumImage);



-(void)getArtistWithArtistName:(NSString *)artistName andCompletion:(completionBlock)completionHandler;

-(void)getTopTracksWithId:(NSString *)artistId andCompletion:(completionBlock)completionHandler;

- (void)getAlbumImagefromURL:(NSURL *)url completionBlock:(downloadCompletionBlock)completionBlock;




@end
