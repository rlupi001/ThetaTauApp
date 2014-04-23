//
//  ChairsEntity.m
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/15/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import "ChairsEntity.h"


@implementation ChairsEntity

@dynamic first;
@dynamic chair;
@dynamic last;
@dynamic email;
@dynamic rollnumber;
@dynamic image;
@dynamic major;

@end

//implementation to convert transformable attribute to uiimage
@implementation ImageToDataTransformer3


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
