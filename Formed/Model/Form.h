//
//  Form.h
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormSegmentedControl.h"

@interface Form : NSObject
@property NSMutableArray<FormInput *> *sections;
- (void)addTextField:(NSString*)name;
- (void)addStepper:(NSString *)name;
- (void)addSwitch:(NSString *)name;
- (void)addHeader:(NSString *)name;
-(FormSegmentedControl *)addSegmentedControl;
- (NSString*)getValue:(NSString *)inputFieldName;
@end
