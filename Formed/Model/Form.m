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

-(NSString*)getValue:(NSString *)inputFieldName {
    NSString *returnValue = nil;
    for (int i = 0; i < _sections.count; i++) {
        for (int j = 0; j < _sections[i].inputs.count; j++) {
            if (_sections[i].inputs[j].inputName == inputFieldName) {
                switch (_sections[i].inputs[j].typeFlag) {
                    case Text:
                    {
                        FormTextField *newText = (FormTextField *) _sections[i].inputs[j];
                        return newText.input;
                    }
                    case Stepper:
                    {
                        FormStepper *thisStepper = (FormStepper *) _sections[i].inputs[j];
                        return @((long)thisStepper.amount).stringValue;
                    }
                    default:
                        break;
                }
            }
        }
    }
    return returnValue;
}

-(void)addSection:(NSString *)sectionName {
    FormSection *newSection = [[FormSection alloc] init];
    newSection.sectionName = sectionName;
    [_sections addObject:newSection];
}

- (void)addTextField:(NSString *)name {
    FormSection *section = [_sections objectAtIndex:_sections.count-1];
    [section addTextField:name];
}

- (void)addStepper:(NSString *)name {
    FormSection *section = [_sections objectAtIndex:_sections.count-1];
    [section addStepper:name];
}

@end
