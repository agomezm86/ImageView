//
//  MenuViewController.h
//  5ImageView
//
//  Created by Alejandro Gomez on 19/12/13.
//  Copyright (c) 2013 Intergrupo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewDelegate <NSObject>
- (void)menuDidSelected:(int)option;
@end

@interface MenuViewController : UITableViewController

@property (assign, nonatomic) id <MenuViewDelegate> delegate;

@end
