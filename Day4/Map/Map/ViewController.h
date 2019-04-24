//
//  ViewController.h
//  Map
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property CLLocationManager * locationMgr;

@end

