//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 15.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "SettingsViewController.h"

@interface SettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *settingsTableView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSettingsTableView];
}

- (void) createSettingsTableView {
    self.settingsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 374, 104) style:UITableViewStylePlain];
    self.settingsTableView.layer.cornerRadius = 16;
    self.settingsTableView.layer.masksToBounds = YES;
    self.settingsTableView.scrollEnabled = NO;
    
    self.settingsTableView.translatesAutoresizingMaskIntoConstraints = false;
    self.settingsTableView.delegate = self;
    self.settingsTableView.dataSource = self;
    [self.view addSubview:self.settingsTableView];
    
    [self.settingsTableView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [self.settingsTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:123].active = true;
    [self.settingsTableView.widthAnchor constraintEqualToConstant:374].active = true;
    [self.settingsTableView.heightAnchor constraintEqualToConstant:104].active = true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.heightAnchor constraintEqualToConstant: (self.settingsTableView.frame.size.height / 2)].active = true;
    cell.textLabel.text = @"blabla";
    return cell;
}

@end