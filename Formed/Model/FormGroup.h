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
@property NSMutableArray<FormInput *> *inputs;
@end
