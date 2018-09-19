//
//  FormedTableControllerTableViewController.m
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormedTableViewController.h"

@interface FormedTableViewController ()
@end

@implementation FormedTableViewController
// Private properties
NSMutableArray<FormInput *> *activeElements;

- (void)viewDidLoad {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *textFieldCellIdentifier = @"formTextFieldCell";
    NSString *stepperCellIdentifier = @"formStepperCell";
    NSString *segmentedCellIdentifier = @"FormSegmentedControlCell";
    
    NSBundle* bundle = [NSBundle bundleWithURL:[NSBundle.mainBundle URLForResource:@"Formed" withExtension:@"bundle"]];
    [tableView registerNib:[UINib nibWithNibName:@"FormStepperCell" bundle:bundle] forCellReuseIdentifier:stepperCellIdentifier];
    [tableView registerNib:[UINib nibWithNibName:@"FormTextFieldCell" bundle:bundle] forCellReuseIdentifier:textFieldCellIdentifier];
    [tableView registerNib:[UINib nibWithNibName:@"FormSegmentedControlCell" bundle:bundle] forCellReuseIdentifier:segmentedCellIdentifier];

    switch (activeElements[indexPath.row].typeFlag) {
        case Text:
        {
            FormTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellIdentifier];
            
            if (cell == nil) {
                cell = [[FormTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellIdentifier];
            }
            
            cell.titleLabel.text = activeElements[indexPath.row].inputName;
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
            cell.segmentedControl.selectedSegmentIndex = *(segmentData.selectedSegment);
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
    
    return activeElements.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)segmentChanged:(NSString *)sectionName {
    NSLog(@"This segmment has been changed.");
    [self refresh];
}

- (void)refresh {
    [self getActiveElements];
    [_tableView reloadData];
}

@end
