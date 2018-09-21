//
//  Form.m
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "Form.h"
#import "Input Types/FormTextField.h"
#import "Input Types/FormStepper.h"
#import "Input Types/FormSwitch.h"
#import "Input Types/FormSegmentedControl.h"
#import "FormHeader.h"

@implementation Form
- (instancetype)init {
    if (self = [super init]) {
        _sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    _sections = nil;
}

//-(NSString*)getValue:(NSString *)inputFieldName {
//    NSString *returnValue = nil;
//    for (int i = 0; i < _sections.count; i++) {
//        for (int j = 0; j < _sections[i].inputs.count; j++) {
//            if (_sections[i].inputs[j].inputName == inputFieldName) {
//                switch (_sections[i].inputs[j].typeFlag) {
//                    case Text:
//                    {
//                        FormTextField *newText = (FormTextField *) _sections[i].inputs[j];
//                        return newText.input;
//                    }
//                    case Stepper:
//                    {
//                        FormStepper *thisStepper = (FormStepper *) _sections[i].inputs[j];
//                        return @((long)thisStepper.amount).stringValue;
//                    }
//                    default:
//                        break;
//                }
//            }
//        }
//    }
//    return returnValue;
//}

- (void)addTextField:(NSString *)name {
    FormTextField *newTextField = [[FormTextField alloc] init];
    newTextField.inputName = name;
    [_sections addObject:newTextField];
}

- (void)addStepper:(NSString *)name {
    FormStepper *newStepper = [[FormStepper alloc] init];
    newStepper.typeFlag = Stepper;
    newStepper.inputName = name;
    [_sections addObject:newStepper];
}

-(void)addSwitch:(NSString *)name {
    FormSwitch *newSwitch = [[FormSwitch alloc] init];
    newSwitch.typeFlag = Switch;
    newSwitch.inputName = name;
    [_sections addObject:newSwitch];
}

-(FormSegmentedControl *)addSegmentedControl {
    FormSegmentedControl *newSegmentedControl = [[FormSegmentedControl alloc] init];
    newSegmentedControl.typeFlag = SegmentedControl;
    newSegmentedControl.selectedSegment = 0;
    [_sections addObject:newSegmentedControl];
    return newSegmentedControl;
}

- (void)addHeader:(NSString *)name {
    FormHeader *newHeader = [[FormHeader alloc] init];
    newHeader.typeFlag = Header;
    newHeader.inputName = name;
    [_sections addObject:newHeader];
}

@end
