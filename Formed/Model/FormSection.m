//
//  FormSection.m
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormSection.h"
#import "Input Types/FormTextField.h"
#import "Input Types/FormStepper.h"

@implementation FormSection

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

@end
