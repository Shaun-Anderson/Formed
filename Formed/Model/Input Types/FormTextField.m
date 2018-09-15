//
//  FormTextField.m
//  Formed
//
//  Created by Shaun Anderson on 11/9/18.
//  Copyright © 2018 Shaun Anderson. All rights reserved.
//

#import "FormTextField.h"

@implementation FormTextField
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.typeFlag = Text;
    }
    return self;
}
@end
