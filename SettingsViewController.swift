//
//  Settings.swift
//  Found
//
//  Created by User on 11.03.17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit
import MapKit

internal protocol SetBack{
    func setSettings(mapType: Int)
}


class SettingsViewController: UIViewController{
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var index = 0
    var mapType = 0
    var currentMapType: Int! = 0
    var delegate: SetBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.selectedSegmentIndex = currentMapType
        
        index = segmentedControl.selectedSegmentIndex
    
    }
    

    @IBAction func indexChanged(_ sender: Any) {
        index = segmentedControl.selectedSegmentIndex
    }

    override func viewWillDisappear(_ animated: Bool) {
        delegate?.setSettings(mapType: index)
    }

}
