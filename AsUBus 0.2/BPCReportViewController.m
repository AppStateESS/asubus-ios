//BPCReportViewController.m
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

#import "BPCReportViewController.h"
#import "Reachability.h"
#import "GAIDictionaryBuilder.h"

@interface BPCReportViewController ()

@end

@implementation BPCReportViewController
@synthesize picker;
@synthesize busses;
@synthesize reportButton;
@synthesize problemTypes;

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
    
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"underPageBackground.png"]];
    
    NSArray *problemArray = [[NSArray alloc] initWithObjects:@"Bus was full", @"Bus was late", @"Bus broke", @"AsUBus error", nil];
    self.problemTypes = problemArray;
    
    NSArray *busArray = [[NSArray alloc] initWithObjects:@"Blue", @"Express", @"Gold", @"Green", @"Orange",
                         @"Pink", @"Pop 105", @"Purple", @"Red", @"Silver", @"State Farm", @"Teal", nil];
    self.busses = busArray;
    
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

- (void)viewDidUnload
{
    [self setReportButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.picker = nil;
    self.problemTypes = nil;
    self.busses = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSInteger problemRow = [picker selectedRowInComponent:kProblemComponent];
    NSInteger busRow = [picker selectedRowInComponent:kBusComponent];
    
    NSString *problem = [problemTypes objectAtIndex:problemRow];
    NSString *bus = [busses objectAtIndex:busRow];
    
    UIViewController *destination = segue.destinationViewController;
    if ([destination respondsToSelector:@selector(setDelegate:)])
    {
        [destination setValue:self forKey:@"delegate"];
    }
    if ([destination respondsToSelector:@selector(setSelection:)])
    {
        NSDictionary *selection = [NSDictionary dictionaryWithObjectsAndKeys:problem, @"problem", bus, @"bus", nil];
        [destination setValue:selection forKey:@"selection"];
    }
}

#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kProblemComponent)
    {
        return [self.problemTypes count];
    }
    
    return [self.busses count];
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kProblemComponent)
    {
        return [self.problemTypes objectAtIndex:row];
    }
    
    return [self.busses objectAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == kProblemComponent)
    {
        return 170;
    }
    
    return 120;
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
