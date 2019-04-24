//
//  ViewController.m
//  Map
//
//  Created by JETS Mobile Lab-10 on 4/23/19.
//  Copyright © 2019 iti. All rights reserved.
//

#import "ViewController.h"
#import "PenAnnotation.h"

@interface ViewController ()
- (IBAction)Click:(id)sender;

@end

@implementation ViewController

# pragma mark : life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[_mapview isZoomEnabled:NO];
//    [_mapview setDelegate:self];
    _mapview.delegate=self;
    _locationMgr=[CLLocationManager new];
    [_locationMgr setDistanceFilter:kCLHeadingFilterNone];
    [_locationMgr setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationMgr setDelegate:self];
    [_locationMgr startUpdatingLocation];
    [_locationMgr requestAlwaysAuthorization];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidAppear:(BOOL)animated{
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation * location=[CLLocation new];
    
    //location.coordinate.longitude;
    printf("latitude: %f\n",location.coordinate.latitude);
    printf("longitude: %f\n",location.coordinate.longitude);
    printf("updated\n");
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    printf("Region Did change Animated\n");
}
-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated{
    printf("Region will change Animated\n");
}

- (IBAction)Click:(id)sender {
    
    CGPoint touchPoint=[sender locationInView:_mapview];
    
    CLLocationCoordinate2D Mycoordinate=[_mapview convertPoint:touchPoint toCoordinateFromView:self.mapview];
    
    PenAnnotation * Annotation=[PenAnnotation new];
    
    Annotation.coordinate=Mycoordinate;
    Annotation.title=@"MAD";
    Annotation.subtitle=@"Hello";
    
    [_mapview addAnnotation:Annotation];

}
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    printf("Annotation selected!");
    printf("%s",[view.annotation.title UTF8String]);
}
@end
