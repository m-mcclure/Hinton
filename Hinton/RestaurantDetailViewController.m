//
//  RestaurantDetailViewController.m
//  Hinton
//
//  Created by Brandon Roberts on 5/19/15.
//  Copyright (c) 2015 BR World. All rights reserved.
//

#import "RestaurantDetailViewController.h"
#import "RestaurantMapTableViewCell.h"

@interface RestaurantDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *menuPhotos;

@end

@implementation RestaurantDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.tableView.delegate = self;
  self.tableView.dataSource = self;
//  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//  self.tableView.separatorInset = UIEdgeInsetsZero;

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
      return [self.tableView dequeueReusableCellWithIdentifier:@"InfoCell"];
      break;
      
    case 1: {
      RestaurantMapTableViewCell *mapCell = [self.tableView dequeueReusableCellWithIdentifier:@"MapCell"];
      mapCell.mapView ; //TODO: Setup the mapview
      return mapCell;
      break;
    }
      
    case 2:
      return [self.tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
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
  return 2 + self.menuPhotos.count;
}


@end
