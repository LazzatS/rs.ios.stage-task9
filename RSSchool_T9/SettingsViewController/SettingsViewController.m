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
    self.settingsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) style:UITableViewStylePlain];
    self.settingsTableView.translatesAutoresizingMaskIntoConstraints = false;
    self.settingsTableView.delegate = self;
    self.settingsTableView.dataSource = self;
    [self.view addSubview:self.settingsTableView];
    
    [self.settingsTableView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:34].active = true;
    [self.settingsTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-200].active = true;
    [self.settingsTableView.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = true;
    [self.settingsTableView.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = true;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"blabla";
    return cell;
}

@end
