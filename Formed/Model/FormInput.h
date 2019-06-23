//
//  FormInput.h
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Text,
    Image,
    Stepper,
    Switch,
    SegmentedControl,
    Header,
    Picker
} InputTypeFlag;

@interface FormInput : NSObject
@property NSString *inputName;
@property InputTypeFlag typeFlag;
@end
