//
//  FormSegmentedControl.h
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormGroup.h"

@interface FormSegmentedControl : FormInput
// Methods
@property NSInteger *numOfSegments;
@property NSMutableArray<FormGroup *> *segmentGroups;
@property NSInteger selectedSegment;
// Properties
- (void)addSegment:(NSString*)name;
- (void)addTextField:(NSString *)name;
@end
