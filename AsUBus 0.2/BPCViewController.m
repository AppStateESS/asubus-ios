//BPCViewController.m
//Copyright (C) 2014  Brian Clee (cleebp AT gmail DOT com)
//
//This program is free software; you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation; either version 2 of the License, or
//(at your option) any later version.
//
//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License along
//with this program; if not, write to the Free Software Foundation, Inc.,
//51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#import "BPCViewController.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"

@interface BPCViewController ()

@end

@implementation BPCViewController
@synthesize routeButton;
@synthesize favoriteButton;
@synthesize reportButton;
@synthesize appalCartButton;
@synthesize infoButton;
@synthesize background_4inch;
@synthesize background_3inch;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.screenName = @"Home";
    
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    //NSLog(@"%f", screenBounds.size.height);
    if (screenBounds.size.height == 568)
    {
        background_4inch.hidden = NO;
        background_3inch.hidden = YES;
        background_4inch.layer.zPosition = 0;
        
        routeButton.layer.zPosition = 2;
        favoriteButton.layer.zPosition = 2;
        reportButton.layer.zPosition = 2;
        appalCartButton.layer.zPosition = 2;
        infoButton.layer.zPosition = 2;
        
        
        [routeButton setFrame:CGRectMake(89, 224, 142, 40)];
        [favoriteButton setFrame:CGRectMake(89, 290, 142, 40)];
        [reportButton setFrame:CGRectMake(89, 358, 142, 40)];
        [appalCartButton setFrame:CGRectMake(89, 420, 142, 40)];
    }
    else
    {
        background_4inch.hidden = YES;
        background_3inch.hidden = NO;
        background_3inch.layer.zPosition = 1;
        
        routeButton.layer.zPosition = 2;
        favoriteButton.layer.zPosition = 2;
        reportButton.layer.zPosition = 2;
        appalCartButton.layer.zPosition = 2;
        infoButton.layer.zPosition = 2;
        
        
        [routeButton setFrame:CGRectMake(100, 202, 120, 40)];
        [favoriteButton setFrame:CGRectMake(100, 255, 120, 40)];
        [reportButton setFrame:CGRectMake(100, 310, 120, 40)];
        [appalCartButton setFrame:CGRectMake(100, 370, 120, 40)];
    }
    
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal
                                             stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [routeButton setBackgroundImage:stretchableButtonImageNormal
                                 forState:UIControlStateNormal];
    [favoriteButton setBackgroundImage:stretchableButtonImageNormal
                           forState:UIControlStateNormal];
    [reportButton setBackgroundImage:stretchableButtonImageNormal
                           forState:UIControlStateNormal];
    [appalCartButton setBackgroundImage:stretchableButtonImageNormal
                            forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed
                                              stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [routeButton setBackgroundImage:stretchableButtonImagePressed
                                 forState:UIControlStateHighlighted];
    [favoriteButton setBackgroundImage:stretchableButtonImagePressed
                           forState:UIControlStateHighlighted];
    [reportButton setBackgroundImage:stretchableButtonImagePressed
                           forState:UIControlStateHighlighted];
    [appalCartButton setBackgroundImage:stretchableButtonImagePressed
                            forState:UIControlStateHighlighted];
}

- (void)viewDidUnload
{
    [self setRouteButton:nil];
    [self setFavoriteButton:nil];
    [self setReportButton:nil];
    [self setAppalCartButton:nil];
    [self setInfoButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

@end
