//
//  NetworkManager.h
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchViewController.h"

@interface NetworkManager : NSObject <SearchViewControllerDelegate>

typedef void(^completionBlock)(NSArray *albums, NSError *error);
//typedef void(^downloadCompletionBlock) (UIImage *artwork);

- (void)getTracksWithCompletion:(completionBlock)completionHandler;
//- (void)getArtworkForURL:(NSURL *)url completionBlock:(downloadCompletionBlock)completionBlock;




@end
