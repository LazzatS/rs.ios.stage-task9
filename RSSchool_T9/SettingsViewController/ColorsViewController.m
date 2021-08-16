//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 16.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "ColorsViewController.h"
#import "SettingsViewController.h"

@interface ColorsViewController () <UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *colorsTableView;
@property (strong, nonatomic) NSArray *colors;

@end

@implementation ColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.colors = @[@"#be2813", @"#3802da", @"#467c24", @"#808080", @"#8e5af7", @"#f07f5a", @"#f3af22", @"#3dacf7", @"#e87aa4", @"#0f2e3f", @"#213711", @"#511307", @"#92003b"];
    [self createColorsTableView];
}

- (void) createColorsTableView {
    self.colorsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 374, 572) style:UITableViewStylePlain];
    self.colorsTableView.layer.cornerRadius = 16;
    self.colorsTableView.layer.masksToBounds = YES;
    self.colorsTableView.scrollEnabled = NO;
    
    self.colorsTableView.translatesAutoresizingMaskIntoConstraints = false;
    self.colorsTableView.delegate = self;
    self.colorsTableView.dataSource = self;
    [self.view addSubview:self.colorsTableView];
    
    [self.colorsTableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.colorsTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:123].active = true;
    [self.colorsTableView.widthAnchor constraintEqualToConstant:374].active = true;
    [self.colorsTableView.heightAnchor constraintEqualToConstant:572].active = true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    CGFloat cellHeight = self.colorsTableView.frame.size.height / self.colors.count;
    [cell.heightAnchor constraintEqualToConstant: cellHeight].active = true;
    
    cell.textLabel.text = self.colors[indexPath.row];
    cell.backgroundColor = [UIColor colorNamed:@"CustomGrayForSettings"];
    
    // silence the warning
    [[NSUserDefaults standardUserDefaults] setValue:@(NO) forKey:@"_UIConstraintBasedLayoutLogUnsatisfiable"];
    
    return cell;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.topItem.title = @"";
}

@end
