//
//  InputTableViewCell.h
//  RealmBarcodeScanner
//
//  Created by Shaun Anderson on 27/8/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextField+PaddedTextField.h"


@protocol FormTextFieldDelegate <NSObject>
-(void)inputChanged:(NSInteger)formID textField:(UITextField *)textField;
@end

@interface FormTextFieldCell : UITableViewCell
@property (weak) id <FormTextFieldDelegate> delegate;
@property (nonatomic, assign) NSInteger formID;
@property (weak, nonatomic) IBOutlet PaddedTextField *inputTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
-(void)valueChanged:(UITextField *)textField;
@end
