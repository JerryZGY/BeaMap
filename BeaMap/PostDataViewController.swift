//
//  PostDataViewController.swift
//  BeaMap
//
//  Created by jerryz on 2015/7/30.
//  Copyright (c) 2015年 JerryZ. All rights reserved.
//

import UIKit

class PostDataViewController: UITableViewController {
    var value:String!
    @IBOutlet weak var value_Proximity: UISwitch!
    @IBOutlet weak var value_Accuracy: UISwitch!
    @IBOutlet weak var value_RSSI: UISwitch!
    
    override func viewDidLoad() {
        loadUserDefaults()
    }
    
    override func viewWillDisappear(animated: Bool) {
        saveUserDefaults()
    }
    
    func loadUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if defaults.boolForKey("isPostProx") {
            value_Proximity.setOn(true, animated: true)
        }
        
        if defaults.boolForKey("isPostAccu") {
            value_Accuracy.setOn(true, animated: true)
        }
        
        if defaults.boolForKey("isPostRSSI") {
            value_RSSI.setOn(true, animated: true)
        }
    }
    
    func saveUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        var valueString = ""
        defaults.setBool(value_Proximity.on, forKey: "isPostProx")
        defaults.setBool(value_Accuracy.on, forKey: "isPostAccu")
        defaults.setBool(value_RSSI.on, forKey: "isPostRSSI")
        defaults.synchronize()
    }
}
