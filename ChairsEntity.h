//
//  ChairsEntity.h
//  OmegaGammaApp
//
//  Created by ripley vit lupine on 4/15/14.
//  Copyright (c) 2014 ripley vit lupine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface ImageToDataTransformer3 : NSValueTransformer{
    
}

@end

@interface ChairsEntity : NSManagedObject


@property (nonatomic, retain) NSString * first;
@property (nonatomic, retain) NSString * last;
@property (nonatomic, retain) NSString * chair;
@property (nonatomic, retain) NSString * rollnumber;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) UIImage * image;
@property (nonatomic, retain) NSString * major;
@end
