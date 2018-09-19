//
//  FormSegmentedControl.m
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormSegmentedControl.h"

@implementation FormSegmentedControl

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.typeFlag = SegmentedControl;
        self.numOfSegments = 0;
        _segmentGroups = [[NSMutableArray alloc] init];
        self.selectedSegment = 0;
    }
    return self;
}

-(void)addSegment:(NSString*)name {
    FormGroup *newGroup = [[FormGroup alloc] init];
    newGroup.groupName = name;
    [_segmentGroups addObject:newGroup];
    _numOfSegments += 1;
}


- (void)addTextField:(NSString *)name {
    FormGroup *group = [_segmentGroups objectAtIndex:_segmentGroups.count-1];
    [group addTextField:name];
}

@end
