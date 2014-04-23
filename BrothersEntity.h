//
//  BrothersEntity.h
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/15/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


//interface to go from transformable attribute to uiimage
@interface ImageToDataTransformer : NSValueTransformer{
    
}

@end

@interface BrothersEntity : NSManagedObject

@property (nonatomic, retain) NSString * group;
@property (nonatomic, retain) NSString * major;
@property (nonatomic, retain) NSString * family;
@property (nonatomic, retain) NSString * first;
@property (nonatomic, retain) NSString * last;
@property (nonatomic, retain) NSString * big;
@property (nonatomic, retain) NSString * rollnumber;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) UIImage * image;


@end
