//
//  FormSection.h
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormInput.h"

@interface FormSection : NSObject
@property NSString *sectionName;
@property NSMutableArray<FormInput *> *inputs;
- (void)addTextField:(NSString*)name;
- (void)addStepper:(NSString *)name;
- (void)addSwitch:(NSString*)name isOn:(Boolean)isOn;
@end
