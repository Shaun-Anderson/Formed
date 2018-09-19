//
//  FormSegmentedControlCell.h
//  Formed
//
//  Created by Shaun Anderson on 15/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FormedUISegmentControl.h"

@protocol FormSegmentDelegate
@required
- (void)segmentChanged:(NSString*)sectionName;
@optional
// list of optional methods
@end

@interface FormSegmentedControlCell : UITableViewCell
@property (weak, nonatomic) IBOutlet FormedUISegmentControl *segmentedControl;
@property (weak) id <FormSegmentDelegate> delegate;
@property int formID;
- (void)setSegments:(NSArray *)segments;
@end
