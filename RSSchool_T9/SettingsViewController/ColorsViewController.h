//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Lazzat Seiilova
// On: 16.08.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ColorSelectionDelegate <NSObject>
- (void) didChooseColor: (NSString *)colorName;
@end

@interface ColorsViewController : UIViewController
@property (nonatomic, weak) id <ColorSelectionDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
