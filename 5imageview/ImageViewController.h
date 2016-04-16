//
//  ImageViewController.h
//  5ImageView
//
//  Created by Alejandro Gomez on 19/12/13.
//  Copyright (c) 2013 Intergrupo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuViewController.h"

@interface ImageViewController : UIViewController <MenuViewDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
