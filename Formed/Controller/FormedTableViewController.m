//
//  FormedTableControllerTableViewController.m
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormedTableViewController.h"
#import <Formed/FormTextField.h>
#import <Formed/FormSwitchCell.h>
#import <Formed/FormSwitch.h>
#import <Formed/FormHeader.h>
#import <HeaderTableViewCell.h>
#import <Formed/FormPicker.h>

@interface FormedTableViewController ()
@end

@implementation FormedTableViewController

#pragma mark - Properties

// Array of active elements.
NSMutableArray<FormInput *> *activeElements;
// Cell identifiers.
NSString *textFieldCellIdentifier = @"formTextFieldCell";
NSString *stepperCellIdentifier = @"formStepperCell";
NSString *segmentedCellIdentifier = @"FormSegmentedControlCell";
NSString *headerCellIdentifier = @"formHeaderCell";
NSString *switchCellIdentifier = @"formSwitchCell";

NSObject *activeObject;


#pragma mark - FormedTableViewController

- (void)viewDidLoad {
    [self registerForKeyboardNotifications];
    // Setup Nibs
    NSBundle* bundle = [NSBundle bundleWithURL:[NSBundle.mainBundle URLForResource:@"Formed" withExtension:@"bundle"]];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormStepperCell" bundle:bundle] forCellReuseIdentifier:stepperCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormSwitchCell" bundle:bundle] forCellReuseIdentifier:switchCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormTextFieldCell" bundle:bundle] forCellReuseIdentifier:textFieldCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormSegmentedControlCell" bundle:bundle] forCellReuseIdentifier:segmentedCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormHeaderCell" bundle:bundle] forCellReuseIdentifier:headerCellIdentifier];
    
    // Set basic options for table.
    self.tableView.alwaysBounceVertical = false;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)refresh {
    [self getActiveElements];
    [self.tableView reloadData];
}

- (void)getActiveElements {
    activeElements = [[NSMutableArray alloc] init];

    // Iterate through the form and retrieve all items that need to be displayed.
    for (int i = 0; i < _form.sections.count; i++) {
        [activeElements addObject:_form.sections[i]];
        
        // If the element is a segmented control add its shown items.
        if(_form.sections[i].typeFlag == SegmentedControl)
        {
            FormSegmentedControl *segmentedControl = (FormSegmentedControl *) _form.sections[i];
            
            // If no inputs in segment group do nothing.
            if(segmentedControl.segmentGroups[(long)segmentedControl.selectedSegment] == NULL)
                return;
            
            // Else add each input to the active elements table.
            for (int j = 0; j < segmentedControl.segmentGroups[(long)segmentedControl.selectedSegment].inputs.count; j++) {
                [activeElements addObject:segmentedControl.segmentGroups[(long)segmentedControl.selectedSegment].inputs[j]];
            }
        }
    }
}

#pragma mark - TableView Delegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (activeElements[indexPath.row].typeFlag) {
        case Text:
        {
            FormTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellIdentifier];
            FormTextField *elementData = (FormTextField *) activeElements[indexPath.row];
            
            if (cell == nil) {
                cell = [[FormTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellIdentifier];
            }
            
            cell.titleLabel.text = elementData.inputName;
            cell.formID = indexPath.row;
            cell.delegate = self;
            cell.inputTextField.text = elementData.input;
            return cell;
        }
            
        case Stepper:
        {
            FormStepperCell *cell = [tableView dequeueReusableCellWithIdentifier:stepperCellIdentifier];
            
            if (cell == nil) {
                cell = [[FormStepperCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stepperCellIdentifier];
            }
            
            cell.titleLabel.text = activeElements[indexPath.row].inputName;
            return cell;
        }
            
        case SegmentedControl:
        {
            FormSegmentedControlCell *cell = [tableView dequeueReusableCellWithIdentifier:segmentedCellIdentifier];
            if (cell == nil) {
                cell = [[FormSegmentedControlCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:segmentedCellIdentifier];
            }
            
            FormSegmentedControl *segmentData = (FormSegmentedControl *) activeElements[indexPath.row];
            [cell setSegments:segmentData.segmentGroups];
            cell.delegate = self;
            cell.formID = indexPath.row;
            cell.segmentedControl.selectedSegmentIndex = segmentData.selectedSegment;
            return cell;
        }
            
        case Switch:
        {
            FormSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:switchCellIdentifier];
            if (cell == nil) {
                cell = [[FormSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:switchCellIdentifier];
            }
            
            FormSwitch *segmentData = (FormSwitch *) activeElements[indexPath.row];
            cell.titleLabel.text = activeElements[indexPath.row].inputName;
            [cell.switchControl setOn:segmentData.isOn];
            return cell;
        }
            
        case Header:
        {
            HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:headerCellIdentifier];
            if (cell == nil) {
                cell = [[HeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:headerCellIdentifier];
            }
            cell.titleLabel.text = activeElements[indexPath.row].inputName;
            return cell;
        }
            
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            return cell;
        }
    }
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)activeElements.count);
    return activeElements.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Input Element Delegates

- (void)segmentChanged:(NSInteger *)segmentFormID selectedIndex:(NSInteger *)selectedIndex {
    NSLog(@"This segmment has been changed.");
    FormSegmentedControl *segmentedControl = (FormSegmentedControl *) activeElements[(long)segmentFormID];
    segmentedControl.selectedSegment = selectedIndex;
    [self refresh];
}

-(void)inputChanged:(NSInteger)formID textField:(UITextField *)textField {
    FormTextField *elementData = (FormTextField *) activeElements[formID];
    elementData.input = textField.text;
}

#pragma mark - Keyboard functionality

// Register for keyboard events
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _tableView.contentInset = contentInsets;
    _tableView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, _activeField.frame.origin) ) {
        [self.tableView scrollRectToVisible:_activeField.frame animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _tableView.contentInset = contentInsets;
    _tableView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - UIPicker DataSource

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 0;
}

#pragma mark - UIPicker Delegate
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return 0;
}

@end
