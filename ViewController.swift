import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, SetBack{
    
    var region = MKCoordinateRegion()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var dropPinButton1: UIButton!
    
    @IBOutlet weak var dropPinButton: UIButton!
    
    @IBOutlet weak var cancelDropPinButton: UIButton!
    
    @IBOutlet weak var locationButton: UIBarButtonItem!
    
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
//    let scale:Double = 0.00001442
    var type: Int = 0
    var curMapType: Int = 0
    var curRegion = [MKCoordinateRegion]()
    var mapViewWidth: Double = 500.0
    var mapViewHeight: Double = 500.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = true

        self.mapView.delegate = self
        
        self.mapView.setRegion(region, animated: true)

        self.navigationItem.leftBarButtonItem?.customView?.isHidden = false
        self.navigationItem.rightBarButtonItem?.customView?.isHidden = false
        
        self.dropPinButton.isHidden = true
        self.dropPinButton1.isHidden = false
        self.cancelDropPinButton.isHidden = true
        self.imageView.isHidden = true
        
        self.imageView.center = CGPoint(x: mapView.center.x, y: mapView.center.y + 31.5)
        
            self.imageView.setNeedsDisplay()
        
        }
    
    override func viewWillAppear(_ animated: Bool) {
        
        switch type {
            case 0:
                self.mapView.mapType = .standard
            case 1:
                self.mapView.mapType = .satellite
            case 2:
                self.mapView.mapType = .hybrid
            default:
                self.mapView.mapType = .standard
            
            }
        
        switch self.mapView.mapType {
            case  .standard:
                curMapType = 0
            case .satellite:
                curMapType = 1
            case .hybrid:
                curMapType = 2
            default:
                curMapType = 0
        }
      
    }

    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(
            latitude: userLocation.coordinate.latitude,
            longitude: userLocation.coordinate.longitude)
        
        let width = self.mapViewWidth
        let height = self.mapViewHeight
        
        self.region = MKCoordinateRegionMakeWithDistance(center, CLLocationDistance(width), CLLocationDistance(height))
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        // Better to make this class property
        let annotationIdentifier = "AnnotationIdentifier"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "pin.png")
        }
        
        return annotationView
    }

    @IBAction func location(_ sender: Any) {
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func showDropPin(_ sender: Any) {
        self.dropPinButton1.isHidden = true
        self.cancelDropPinButton.isHidden = false
        self.dropPinButton.isHidden = false
        self.imageView.isHidden = false
        
        self.navigationItem.leftBarButtonItem?.customView?.isHidden = true
        self.navigationItem.rightBarButtonItem?.customView?.isHidden = true

    }
    
    @IBAction func cancelDropPin(_ sender: Any) {
        self.dropPinButton.isHidden = true
        self.dropPinButton1.isHidden = false
        self.cancelDropPinButton.isHidden = true
        self.imageView.isHidden = true
        
        self.navigationItem.leftBarButtonItem?.customView?.isHidden = false
        self.navigationItem.rightBarButtonItem?.customView?.isHidden = false
    }
    
    @IBAction func dropPin(_ sender: Any) {
        self.dropPinButton1.isHidden = false
        self.cancelDropPinButton.isHidden = true
        self.dropPinButton.isHidden = true
        self.imageView.isHidden = true
        
        self.navigationItem.leftBarButtonItem?.customView?.isHidden = false
        self.navigationItem.rightBarButtonItem?.customView?.isHidden = false
        
        let latitude = mapView.userLocation.coordinate.latitude
        let longitude = mapView.userLocation.coordinate.longitude
        
        
        let pin = Pin(c
            : mapView.region.center, title: "\(latitude); \(longitude)")
        mapView.addAnnotation(pin)
        print(self.mapView.region.center)
    }
    
    @IBAction func ZoomIn(_ sender: Any) {
        let span = MKCoordinateSpanMake( self.mapView.region.span.latitudeDelta / 2,  self.mapView.region.span.longitudeDelta / 2)
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
        let curRegion = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(curRegion, animated: true)
    }
    
    @IBAction func ZoomOut(_ sender: Any) {
        if  self.mapView.region.span.latitudeDelta < 90 &&  self.mapView.region.span.longitudeDelta < 90  {
        let span = MKCoordinateSpanMake( self.mapView.region.span.latitudeDelta * 2,  self.mapView.region.span.longitudeDelta * 2)
        let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
        let curRegion = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(curRegion, animated: true)
        }
        else{
            let span = MKCoordinateSpanMake(169, 169)
            let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: self.mapView.camera.centerCoordinate.latitude, longitude: self.mapView.camera.centerCoordinate.longitude)
            let curRegion = MKCoordinateRegionMake(coordinate, span)
            self.mapView.setRegion(curRegion, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? SettingsViewController
        vc?.delegate = self
        if let settings = segue.destination as?
            SettingsViewController{
                settings.currentMapType = curMapType
            }
    }
    
    internal func setSettings(mapType: Int) {
        self.type = mapType
    }
    

}
