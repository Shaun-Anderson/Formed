//
//  FormPicker.h
//  Formed
//
//  Created by Shaun Anderson on 12/10/18.
//

#import <Foundation/Foundation.h>
#import "FormInput.h"

NS_ASSUME_NONNULL_BEGIN

@interface FormPicker : FormInput
@property NSArray<NSString *> *pickerOptions;
@end

NS_ASSUME_NONNULL_END
