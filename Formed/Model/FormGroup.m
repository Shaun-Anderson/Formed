//
//  FormGroup.m
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormGroup.h"
#import "Input Types/FormTextField.h"
#import "Input Types/FormStepper.h"
#import "Input Types/FormSwitch.h"

@implementation FormGroup

- (instancetype)init {
    if (self = [super init]) {
        _inputs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addTextField:(NSString*)name {
    FormTextField *newText = [[FormTextField alloc] init];
    newText.inputName = name;
    newText.typeFlag = Text;
    [_inputs addObject:newText];
}

- (void)addStepper:(NSString*)name {
    FormStepper *newStepper = [[FormStepper alloc] init];
    newStepper.inputName = name;
    newStepper.typeFlag = Stepper;
    [_inputs addObject:newStepper];
}

- (void)addSwitch:(NSString*)name isOn:(Boolean)isOn {
    FormSwitch *newSwitch = [[FormSwitch alloc] init];
    newSwitch.inputName = name;
    newSwitch.typeFlag = Switch;
    newSwitch.isOn = &(isOn);
    [_inputs addObject:newSwitch];
}

@end
