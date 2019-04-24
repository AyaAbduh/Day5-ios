//
//  PenAnnotation.h
//  Map
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface PenAnnotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end

NS_ASSUME_NONNULL_END
