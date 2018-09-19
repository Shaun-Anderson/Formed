//
//  FormSegmentedControlCell.m
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormSegmentedControlCell.h"
#import "FormGroup.h"

@implementation FormSegmentedControlCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.formID = 0;
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)segmentControlChanged:(FormedUISegmentControl *)sender {
    NSLog(@"%ld", (long)sender.formID);
    
    
    [_delegate segmentChanged:(long *)sender.formID selectedIndex:sender.selectedSegmentIndex];
}

- (void)setSegments:(NSArray *)segments
{
    [_segmentedControl removeAllSegments];
    
    for (FormGroup *segment in segments) {
        [_segmentedControl insertSegmentWithTitle:segment.groupName atIndex:_segmentedControl.numberOfSegments animated:NO];
    }
}

@end
