//
//  TinderMapViewController.swift
//  DemoGoJek
//
//  Created by Coc Coc on 9/13/20.
//  Copyright © 2020 Coc Coc. All rights reserved.
//

import MapKit
import UIKit

class TinderMapViewController: UIViewController, TinderUserInfoViewProtocol {
  var userViewModel: UserViewModel!
  private let newPin = MKPointAnnotation()

  @IBOutlet private var addressLabel: UILabel!
  @IBOutlet private var mapView: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()

    addressLabel.text = userViewModel.address
    mapView.isUserInteractionEnabled = false
    mapView.showsUserLocation = false
    if let location = userViewModel.location {
      let viewRegion = MKCoordinateRegion(center: location, latitudinalMeters: 200, longitudinalMeters: 200)
      mapView.setRegion(viewRegion, animated: true)

      newPin.coordinate = location
      mapView.addAnnotation(newPin)
    }
  }
}
