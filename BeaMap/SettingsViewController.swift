//
//  SettingsViewController.swift
//  BeaMap
//
//  Created by jerryz on 2015/7/28.
//  Copyright (c) 2015年 JerryZ. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ValueViewController {
            let label = (sender as! UITableViewCell).viewWithTag(1) as! UILabel
            
            vc.title = label.text
            vc.placeholder = label.text
            
            switch segue.identifier! {
            case "DeviceID":
                vc.keyboardType = UIKeyboardType.Default
                return
            case "UUID":
                vc.keyboardType = UIKeyboardType.Default
                return
            case "PostFreq":
                return
            default:
                return
            }
        }
    }
}
