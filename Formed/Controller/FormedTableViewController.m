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

- (void)viewDidLoad {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *textFieldCellIdentifier = @"formTextFieldCell";
    NSString *stepperCellIdentifier = @"formStepperCell";
    //NSString *sliderCellIdentifier = @"formSliderCell";
    
    NSBundle* bundle = [NSBundle bundleWithURL:[NSBundle.mainBundle URLForResource:@"Formed" withExtension:@"bundle"]];
    [tableView registerNib:[UINib nibWithNibName:@"FormStepperCell" bundle:bundle] forCellReuseIdentifier:stepperCellIdentifier];
    [tableView registerNib:[UINib nibWithNibName:@"FormTextFieldCell" bundle:bundle] forCellReuseIdentifier:textFieldCellIdentifier];
    
    switch (_form.sections[indexPath.section].inputs[indexPath.row].typeFlag) {
        case Text:
        {
            FormTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:textFieldCellIdentifier];
            
            if (cell == nil) {
                cell = [[FormTextFieldCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:textFieldCellIdentifier];
            }
            
            cell.titleLabel.text = _form.sections[indexPath.section].inputs[indexPath.row].inputName;
            return cell;
        }
            
        case Stepper:
        {
            FormStepperCell *cell = [tableView dequeueReusableCellWithIdentifier:stepperCellIdentifier];
            
            if (cell == nil) {
                cell = [[FormStepperCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:stepperCellIdentifier];
            }
            
            cell.titleLabel.text = _form.sections[indexPath.section].inputs[indexPath.row].inputName;
            return cell;
        }
            
        default:
        {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            return cell;
        }
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _form.sections[section].inputs.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _form.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _form.sections[section].sectionName;
}


@end
