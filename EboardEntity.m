//
//  EboardEntity.m
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/15/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import "EboardEntity.h"


@implementation EboardEntity

@dynamic first;
@dynamic position;
@dynamic last;
@dynamic email;
@dynamic rollnumber;
@dynamic image;
@dynamic major;
@dynamic family;
@end

//implementation to convert transformable attribute to uiimage
@implementation ImageToDataTransformer2


+ (BOOL)allowsReverseTransformation

{
    
    return YES;
    
}

+ (Class)transformedValueClass

{
    
    return [NSData class];
    
}

- (id)transformedValue:(id)value

{
    
    return UIImagePNGRepresentation(value);
    
}

- (id)reverseTransformedValue:(id)value

{
    
    return [UIImage imageWithData:value];
    
}



@end