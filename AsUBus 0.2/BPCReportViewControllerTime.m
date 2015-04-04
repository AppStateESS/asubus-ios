//BPCReportViewControllerTime.m
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

#import "BPCReportViewControllerTime.h"
#import "GAIDictionaryBuilder.h"

@interface BPCReportViewControllerTime ()

@end

@implementation BPCReportViewControllerTime
@synthesize reportButton;
@synthesize picker;
@synthesize routeName;
@synthesize problemName;
@synthesize delegate;
@synthesize selection;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.screenName = @"Report";
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"underPageBackground.png"]];
    
    routeName = [selection objectForKey:@"bus"];
    problemName = [selection objectForKey:@"problem"];
    
    UIImage *buttonImageNormal = [UIImage imageNamed:@"whiteButton.png"];
    UIImage *stretchableButtonImageNormal = [buttonImageNormal
                                             stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [reportButton setBackgroundImage:stretchableButtonImageNormal
                            forState:UIControlStateNormal];
    
    UIImage *buttonImagePressed = [UIImage imageNamed:@"blueButton.png"];
    UIImage *stretchableButtonImagePressed = [buttonImagePressed
                                              stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    [reportButton setBackgroundImage:stretchableButtonImagePressed
                            forState:UIControlStateHighlighted];
}

-(NSString*)getTimetoFill
{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm a"];
    
    NSString *timetofill = [outputFormatter stringFromDate:picker.date];
    return timetofill;
}

- (IBAction)mailButtonPressed:(id)sender
{    
    //Sets the message to be used in the email based on which problem was chosen
    NSString *message;
    message = [[NSString alloc] initWithFormat: @"The following message is formated in order to be processed in a database, if you would like to add a personal message please add it after Notes and do not edit the hash tags.\n\n #Problem: %@ \n #Route: %@ \n #Time of Incident: %@ \n #Notes: ", problemName, routeName, [self getTimetoFill]];
    
    //The following sets up the mail view with the information given by the user input in the picker
    NSArray *recipients;
    
    MFMailComposeViewController *mailComposer;
    mailComposer  = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    if ([problemName isEqualToString:@"AsUBus error"])
    {
        recipients = [[NSArray alloc] initWithObjects:@"report.asubus@gmail.com", nil];
        [mailComposer setSubject:@"AsUBus Issue"];
    }
    else
    {
        recipients = [[NSArray alloc] initWithObjects:@"report.asubus@gmail.com", nil];
        [mailComposer setSubject:@"appalCart Issue"];
    }
    [mailComposer setModalPresentationStyle:UIModalPresentationFormSheet];
    [mailComposer setMessageBody:message isHTML:NO];
    [mailComposer setToRecipients:recipients];
    [self presentViewController:(UIViewController *)mailComposer animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    if (error)
    {
        NSLog(@"ERROR - mailComposeController: %@", [error localizedDescription]);
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
    return;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

@end
