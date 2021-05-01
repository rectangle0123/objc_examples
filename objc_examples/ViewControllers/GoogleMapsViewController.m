//
//  GoogleMapsViewController.m
//  objc_examples
//
//  Created by Yoshii Hiroki on 2021/05/01.
//

#import "GoogleMapsViewController.h"

@interface GoogleMapsViewController () {
    CLLocationManager *locationManager;
    GMSMapView *mapView;
}

@end

@implementation GoogleMapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初期化
    self.title = NSLocalizedString(@"page_title_googlemaps", nil);
    [self.navigationController.navigationBar setTranslucent:NO];
    
    // LocationManagerの初期化
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    locationManager.distanceFilter = 50;
    [locationManager startUpdatingLocation];
    locationManager.delegate = self;
    
    // 地図を作成する
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:35.6812362 longitude:139.7649361 zoom:14];
    mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
    mapView.settings.myLocationButton = YES;
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    mapView.myLocationEnabled = YES;
    
    // 地図を表示する（現在地にロケーションされるまで非表示）
    [self.view addSubview:mapView];
    mapView.hidden = YES;
    
    // マーカーを作成する
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(35.6829292, 139.7767223);
    marker.title = NSLocalizedString(@"gmaps_marker_title", nil);
    marker.snippet = NSLocalizedString(@"gmaps_marker_snippet", nil);
    marker.map = mapView;
}

#pragma mark - CLLocationManagerDelegate

// ロケーションイベントの処理
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude zoom:mapView.camera.zoom];
    if (mapView.isHidden) {
        mapView.hidden = NO;
        mapView.camera = camera;
    } else {
        [mapView animateToCameraPosition:camera];
    }
}

@end
