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

@interface FormedTableViewController ()
@end

@implementation FormedTableViewController
// Private properties
NSMutableArray<FormInput *> *activeElements;

NSString *textFieldCellIdentifier = @"formTextFieldCell";
NSString *stepperCellIdentifier = @"formStepperCell";
NSString *segmentedCellIdentifier = @"FormSegmentedControlCell";
NSString *headerCellIdentifier = @"formHeaderCell";
NSString *switchCellIdentifier = @"formSwitchCell";

- (void)viewDidLoad {
    
    NSBundle* bundle = [NSBundle bundleWithURL:[NSBundle.mainBundle URLForResource:@"Formed" withExtension:@"bundle"]];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormStepperCell" bundle:bundle] forCellReuseIdentifier:stepperCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormSwitchCell" bundle:bundle] forCellReuseIdentifier:switchCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormTextFieldCell" bundle:bundle] forCellReuseIdentifier:textFieldCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"FormSegmentedControlCell" bundle:bundle] forCellReuseIdentifier:segmentedCellIdentifier];
    [self.tableView registerNib:[UINib nibWithNibName:@"HeaderTableViewCell" bundle:bundle] forCellReuseIdentifier:headerCellIdentifier];

    self.tableView.alwaysBounceVertical = false;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
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
            return cell;
        }
            
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            return cell;
        }
    }
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
            
            for (int j = 0; j < segmentedControl.segmentGroups[(long)segmentedControl.selectedSegment].inputs.count; j++) {
                [activeElements addObject:segmentedControl.segmentGroups[(long)segmentedControl.selectedSegment].inputs[j]];
            }
        }
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)activeElements.count);
    return activeElements.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)segmentChanged:(NSInteger *)segmentFormID selectedIndex:(NSInteger *)selectedIndex {
    NSLog(@"This segmment has been changed.");
    FormSegmentedControl *segmentedControl = (FormSegmentedControl *) _form.sections[(long)segmentFormID];
    segmentedControl.selectedSegment = selectedIndex;
    [self refresh];
}

- (void)refresh {
    [self getActiveElements];
    //NSLog(@"%lu", (unsigned long)activeElements.count);
    [self.tableView reloadData];
}

-(void)inputChanged:(NSInteger)formID textField:(UITextField *)textField {
    NSLog(@"textchanged");
    FormTextField *elementData = (FormTextField *) activeElements[formID];
    elementData.input = textField.text;
}


@end
