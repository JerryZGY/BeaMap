//
//  SettingsViewController.swift
//  BeaMap
//
//  Created by jerryz on 2015/7/28.
//  Copyright (c) 2015年 JerryZ. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var value_DeviceID: UILabel!
    @IBOutlet weak var value_UUID: UILabel!
    @IBOutlet weak var value_PostFreq: UILabel!
    @IBOutlet weak var value_PostData: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        loadUserDefaults()
        if let selectedIndex = self.tableView.indexPathForSelectedRow() {
            self.tableView.deselectRowAtIndexPath(selectedIndex, animated: true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ValueViewController {
            let label = (sender as! UITableViewCell).viewWithTag(1) as! UILabel
            let value = (sender as! UITableViewCell).viewWithTag(2) as! UILabel
            vc.title = label.text
            vc.placeholder = label.text
            vc.value = value.text
            
            switch segue.identifier! {
            case "DeviceID":
                return
            case "UUID":
                return
            case "PostFreq":
                vc.keyboardType = UIKeyboardType.NumberPad
                return
            default:
                return
            }
        }
    }

    func loadUserDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        var postData = [String]()
        value_DeviceID.text = defaults.stringForKey("DeviceID")
        value_UUID.text = defaults.stringForKey("UUID")
        value_PostFreq.text = defaults.stringForKey("Post Frequency")
        
        if defaults.boolForKey("isPostProx") {
            postData.append("Prox")
        }
        
        if defaults.boolForKey("isPostAccu") {
            postData.append("Accu")
        }
        
        if defaults.boolForKey("isPostRSSI") {
            postData.append("RSSI")
        }
        
        var postDataString = ", ".join(postData.map { $0 })
        
        if postData.count == 3 {
            value_PostData.text = "All"
        }
        else if postDataString.isEmpty {
            value_PostData.text = "None"
        }
        else {
            value_PostData.text = postDataString
        }
    }
}
