//
//  BrothersEntity.m
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/15/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import "BrothersEntity.h"


@implementation BrothersEntity

@dynamic group;
@dynamic family;
@dynamic first;
@dynamic big;
@dynamic last;
@dynamic rollnumber;
@dynamic email;
@dynamic image;
@dynamic major;

@end

//implementation to convert transformable attribute to uiimage
@implementation ImageToDataTransformer


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