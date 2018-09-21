//
//  InputTableViewCell.m
//  RealmBarcodeScanner
//
//  Created by Shaun Anderson on 27/8/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormTextFieldCell.h"

@implementation FormTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.inputTextField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _inputTextField.text = @"";
}

-(void)valueChanged:(UITextField *)textField {
    [self.delegate inputChanged:_formID textField:textField];
}

@end
