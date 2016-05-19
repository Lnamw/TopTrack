//
//  SearchViewController.h
//  TopTrack
//
//  Created by Elena Maso Willen on 18/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewControllerDelegate <NSObject>

-(void)returnArtistTyped:(NSString *)artist;

@end

@interface SearchViewController : UIViewController

@property (weak, nonatomic)id<SearchViewControllerDelegate>delegate;

@end
