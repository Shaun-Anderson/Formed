//
//  FormedTableControllerTableViewController.h
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Form.h"
#import "FormStepperCell.h"
#import "FormTextFieldCell.h"
#import "FormSegmentedControlCell.h"

@interface FormedTableViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, FormSegmentDelegate, FormTextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property Form* form;
@property UITableView* tableView;
@property UITableViewCell* activeField;
- (void)getActiveElements;
- (void)refresh;
@end
