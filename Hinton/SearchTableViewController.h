//
//  SearchTableViewController.h
//  Hinton
//
//  Created by Brandon Roberts on 5/21/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTableDelegate <NSObject>

-(void)searchTableDidSelectGenre:(NSString *)genre;

@end

@interface SearchTableViewController : UITableViewController <UISearchBarDelegate, UISearchResultsUpdating>

@property (weak, nonatomic) id<SearchTableDelegate> delegate;

@end
