//
//  Form.h
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormSection.h"

@interface Form : NSObject
@property NSMutableArray<FormSection *> *sections;
- (void)addSection:(NSString*)sectionName;
- (void)addTextField:(NSString*)name;
- (void)addStepper:(NSString *)name;
- (void)addSwitch:(NSString *)name;
- (NSString*)getValue:(NSString *)inputFieldName;

@end
