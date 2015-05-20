//
//  RestaurantDetailViewController.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantDetailViewController.h"
#import "BackendService.h"
#import "Restaurant.h"
#import "MapPoint.h"
#import "RestaurantMapTableViewCell.h"
#import "RestaurantInfoTableViewCell.h"
#import "RestaurantImageTableViewCell.h"
#import "ImageFetcher.h"

@interface RestaurantDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *photoURLs;
@property (strong, nonatomic) ImageFetcher *imageFetcher;
@property (nonatomic) CGSize cellImageSize;

@property (strong, nonatomic) Restaurant *restaurantToDisplay;

@end

@implementation RestaurantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  self.imageFetcher = [[ImageFetcher alloc] init];
  self.cellImageSize = CGSizeMake(600, 400);
  
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
  
  self.restaurantToDisplay = [BackendService restaurantForID:self.annotation.restaurantId];
}

#pragma mark <UICollectionViewDataSource>

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self computeNumberOfRows];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  switch (indexPath.row) {
    case 0:
      return [self configureInfoCell:[self.tableView dequeueReusableCellWithIdentifier:@"InfoCell"]];
      break;
      
    case 1: {
      return [self configureMapCell:[self.tableView dequeueReusableCellWithIdentifier:@"MapCell"]];
      break;
    }
      
    case 2:
      return [self configureImageCell:[self.tableView dequeueReusableCellWithIdentifier:@"ImageCell"] forImageArrayIndex:0];
      break;
      
    case 3:
      return [self configureImageCell:[self.tableView dequeueReusableCellWithIdentifier:@"ImageCell"] forImageArrayIndex:1];
      break;
      
    default:
      return [UITableViewCell new];
      break;
  }
  
}

- (IBAction)closeButtonTapped:(id)sender {
  if ([self.delegate respondsToSelector:@selector(userDidTapCloseButton)]) {
    [self.delegate userDidTapCloseButton];
  }
}

#pragma mark - Custom Methods

-(NSInteger)computeNumberOfRows {
  return 2 + self.photoURLs.count;
}

-(RestaurantInfoTableViewCell *)configureInfoCell:(RestaurantInfoTableViewCell *)infoCell {
  infoCell.restaurantToDisplay = self.restaurantToDisplay;
  return infoCell;
}

-(RestaurantMapTableViewCell *)configureMapCell:(RestaurantMapTableViewCell *)mapCell {
  mapCell.mapPoint = self.annotation;
  return mapCell;
}

-(RestaurantImageTableViewCell *)configureImageCell:(RestaurantImageTableViewCell *)imageCell forImageArrayIndex:(NSInteger)index {
  
  imageCell.imageToDisplay = nil;
  
  if (index < self.photoURLs.count) {
    
    [self.imageFetcher fetchImageAtURL:self.photoURLs[index] size:self.cellImageSize completionHandler:^(UIImage *fetchedImage, NSError *error) {
      if (!error) {
        imageCell.imageToDisplay = fetchedImage;
      } else {
        NSLog(@"ImageError: %@", error.localizedDescription);
      }
    }];
  }
  
  return imageCell;
  
}


@end
