//
//  FormGroup.h
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormInput.h"

@interface FormGroup : NSObject
// Properties
@property NSString *groupName;
@property NSMutableArray<FormInput *> *inputs;
// Methods
- (void)addTextField:(NSString*)name;
- (void)addStepper:(NSString *)name;
- (void)addSwitch:(NSString*)name isOn:(Boolean)isOn;
@end
