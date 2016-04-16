//
//  ImageViewController.m
//  5ImageView
//
//  Created by Alejandro Gomez on 19/12/13.
//  Copyright (c) 2013 Intergrupo. All rights reserved.
//

#import "ImageViewController.h"
#import "AppDelegate.h"

@interface ImageViewController ()

@property (nonatomic, strong) UIPopoverController *menuPopoverController;

@end

@implementation ImageViewController

@synthesize imageView;


#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    imageView.image = [UIImage imageNamed:@"landscape.jpg"];
    [self adjustImageContentMode];
}

- (void)adjustImageContentMode
{
    int option = [[[NSUserDefaults standardUserDefaults]objectForKey:@"imageFit"]intValue];
    switch (option) {
        case 0: imageView.contentMode = UIViewContentModeScaleToFill; break;
        case 1: imageView.contentMode = UIViewContentModeScaleAspectFill; break;
        case 2: imageView.contentMode = UIViewContentModeScaleAspectFit; break;
    }
}


#pragma mark - UIBarButton

- (IBAction)displayMenuView:(id)sender
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        MenuViewController *controller = (MenuViewController *)[[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"aMenuViewController"];
        controller.delegate = self;
        if (self.menuPopoverController)
        {
            [self.menuPopoverController dismissPopoverAnimated:NO];
            self.menuPopoverController = nil;
        }
        self.menuPopoverController = [[UIPopoverController alloc] initWithContentViewController:controller];
        self.menuPopoverController.delegate = self;
        self.menuPopoverController.popoverContentSize = CGSizeMake(320.0, 300.0);
        UIBarButtonItem *barButtonItem = (UIBarButtonItem *)sender;
        [self.menuPopoverController presentPopoverFromBarButtonItem:barButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
    else
        [self performSegueWithIdentifier:@"MenuViewController" sender:sender];
}


#pragma mark - UIStoryboardSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MenuViewController"])
    {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        MenuViewController *controller = (MenuViewController *)navController.topViewController;
        controller.delegate = self;
    }
}


#pragma mark - MenuViewDelegate

- (void)menuDidSelected:(int)option;
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [self.menuPopoverController dismissPopoverAnimated:NO];
        self.menuPopoverController = nil;
    }
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [delegate updateUserDefaults:@"imageFit" withObject:[NSString stringWithFormat:@"%d", option]];
    [self adjustImageContentMode];
}


#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
