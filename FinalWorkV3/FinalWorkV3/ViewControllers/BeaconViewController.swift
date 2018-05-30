//
//  BeaconViewController.swift
//  FinalWorkV3
//
//  Created by student on 19/05/2018.
//  Copyright © 2018 EHB. All rights reserved.
//

import UIKit
import CoreLocation

class BeaconViewController: UIViewController {

    let locationManager = CLLocationManager()
    @IBOutlet weak var lblLookingLoc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension BeaconViewController : CLLocationManagerDelegate {
    
}
